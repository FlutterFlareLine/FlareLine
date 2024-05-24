import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flareline/entity/conversation_entity.dart';
import 'package:flareline/entity/message_entity.dart';
import 'package:flareline_uikit/core/event/global_event.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline/utils/firebase_store_utils.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ChatGptProvider extends BaseProvider {
  ChatGptProvider(super.context);

  @override
  void init(BuildContext context) {
    controller = TextEditingController();
  }

  late TextEditingController controller;

  String _url = "";

  String get url => _url;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _showSettings = false;

  bool get showSettings => _showSettings;

  List<MessageEntity> messageList = [];

  int get messageCount => messageList.length;

  ConversationEntity? _conversationEntity;

  ConversationEntity? get conversationEntity => _conversationEntity;

  bool _showConversation = false;

  bool get showConversation => _showConversation;

  set showConversation(bool show) {
    _showConversation = show;
    notifyListeners();
  }

  @override
  // TODO: implement isRegisterEventBus
  bool get isRegisterEventBus => true;

  @override
  void handleEventBus(BuildContext context, EventInfo eventInfo) {
    if (eventInfo.eventType == 'showConversation') {
      setConversationEntity(context, eventInfo.obj);
    }
    super.handleEventBus(context, eventInfo);
  }

  void setConversationEntity(BuildContext ctx, ConversationEntity? item) {
    _conversationEntity = item;
    notifyListeners();
    if (_conversationEntity == null) {
      return;
    }
    fetchMessages(ctx, _conversationEntity!.id);
  }

  MessageEntity getItemMessage(int index) {
    return messageList.elementAt(index);
  }

  Future<void> send(BuildContext ctx) async {
    String? model = ctx.read<StoreProvider>().openAiModel;
    if (model == null) {
      SnackBarUtil.showSnack(ctx, 'please set your model');
      return;
    }
    if (controller.text.isEmpty) {
      SnackBarUtil.showSnack(ctx, 'please input target url');
      return;
    }

    if (_isLoading) {
      return;
    }

    _isLoading = true;
    // notifyListeners();
    String sendText = controller.text.trim();
    String email = ctx.read<StoreProvider>().email;

    controller.clear();

    if (conversationEntity == null) {
      startNewChat(ctx, title: sendText);
    }
    try {
      MessageEntity messageEntity = MessageEntity()
        ..id = Uuid().v1()
        ..isUser = true
        ..content = sendText
        ..timestamp = DateTime.timestamp().millisecondsSinceEpoch
        ..conversationId = conversationEntity!.id
        ..belongUid = email;
      messageList.add(messageEntity);
      addMessage(ctx, messageEntity);
      notifyListeners();

      // The user message to be sent to the request.
      final userMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            sendText,
          ),
        ],
        role: OpenAIChatMessageRole.user,
      );
      final chatStream = OpenAI.instance.chat.createStream(
        model: model!,
        messages: [
          userMessage,
        ],
        seed: 423,
        n: 2,
      );

      String responseId = Uuid().v1();

      chatStream.listen(
        (streamChatCompletion) {
          final content = streamChatCompletion.choices.first.delta.content;

          String msgText =
              content?.map((e) => e?.text ?? '').toList().join('') ?? '';

          final index =
              messageList.indexWhere((element) => element.id == responseId);
          if (index == -1) {
            MessageEntity responseMessage = MessageEntity()
              ..id = responseId
              ..isUser = false
              ..content = msgText
              ..timestamp = DateTime.timestamp().millisecondsSinceEpoch
              ..conversationId = conversationEntity!.id
              ..belongUid = email;
            messageList.add(responseMessage);
          } else {
            messageList.elementAt(index).content += msgText;
          }

          notifyListeners();
        },
        onDone: () {
          _isLoading = false;
          notifyListeners();
          addMessage(ctx, messageList.last);
        },
      );
    } catch (e) {
      MessageEntity responseMessage = MessageEntity()
        ..id = const Uuid().v1()
        ..isUser = false
        ..content = e.toString()
        ..timestamp = DateTime.timestamp().millisecondsSinceEpoch
        ..belongUid = email;
      responseMessage.content = e.toString();
      messageList.add(responseMessage);

      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleSetting(BuildContext ctx) {
    _showSettings = !_showSettings;
    notifyListeners();
  }

  void startNewChat(BuildContext ctx, {String? title}) {
    controller.clear();
    String email = ctx.read<StoreProvider>().email;
    _conversationEntity = ConversationEntity()
      ..id = const Uuid().v1()
      ..type = 'text'
      ..title = title ?? ''
      ..timestamp = DateTime.timestamp().millisecondsSinceEpoch
      ..belongUid = email;

    addConversation(ctx, conversationEntity!);

    messageList.clear();
    notifyListeners();
  }

  fetchMessages(BuildContext ctx, String conversationId) async {
    String email = ctx.read<StoreProvider>().email;
    log('fetchMessages ${conversationId}  ${email}');
    final query = await FirebaseStoreUtils.db
        .collection('messages')
        .where('belongUid', isEqualTo: email)
        .where('conversationId', isEqualTo: conversationId)
        .orderBy('timestamp')
        .get();
    if (query.docs.isNotEmpty) {
      messageList.clear();
      List<MessageEntity> list = query.docs.map((element) {
        MessageEntity entity = MessageEntity.fromJson(element.data());
        return entity;
      }).toList();

      messageList.addAll(list);
      notifyListeners();
    }
  }

  addConversation(BuildContext ctx, ConversationEntity conversationEntity) {
    FirebaseStoreUtils.add('conversation', conversationEntity!.toJson());
  }

  addMessage(BuildContext ctx, MessageEntity messageEntity) async {
    await FirebaseStoreUtils.add('messages', messageEntity!.toJson());
  }

  bool? _hasCopied;

  bool get hasCopied => _hasCopied ?? false;

  Future<void> copy(BuildContext context, String content) async {
    if (hasCopied) return;
    await Clipboard.setData(ClipboardData(text: content));
    _hasCopied = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _hasCopied = false;
      notifyListeners();
    });
  }

  void toggleConversation(BuildContext ctx) {
    showConversation = !showConversation;
  }
}
