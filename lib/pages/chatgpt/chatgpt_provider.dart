import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:flareline/entity/conversation_entity.dart';
import 'package:flareline/entity/message_entity.dart';
import 'package:flareline/provider/openai_provider.dart';
import 'package:flareline/utils/cache_util.dart';
import 'package:flareline/utils/login_util.dart';
import 'package:flareline_uikit/core/event/global_event.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline/utils/firebase_store_utils.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ChatGptProvider extends BaseProvider {
  ChatGptProvider(super.context);

  final List<NavigationRailDestination> _destinations = const [
    NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 10),
        icon: Icon(
          Icons.add_circle_outline,
        ),
        label: Text(
          "New Chat",
        )),
    NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 10),
        icon: Icon(Icons.history),
        label: Text(
          "History",
        )),
    NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 10),
        icon: Icon(Icons.edit_note),
        label: Text(
          "Write",
        )),
    NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 10),
        icon: Icon(Icons.edit_note),
        label: Text(
          "Imitate",
        )),
    NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 10),
        icon: Icon(Icons.draw),
        label: Text(
          "Draw",
        )),
    NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 10),
        icon: Icon(Icons.more_vert),
        label: Text(
          "More",
        )),
    NavigationRailDestination(
        padding: EdgeInsets.symmetric(vertical: 10),
        icon: Icon(Icons.settings),
        label: Text("Setting")),
  ];

  int _selectedIndex = 0;

  List<NavigationRailDestination> get destinations => _destinations;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }

  ConversationEntity? getConversation(){
    dynamic data = CacheUtil.instance.read("conversation");
    if(data!=null) {
      ConversationEntity? conversationEntity = ConversationEntity.fromJson(
          jsonDecode(data));
      return conversationEntity;
    }
    return null;
  }

  @override
  void init(BuildContext context) {
    controller = TextEditingController();
    setConversationEntity(
        context, getConversation());
  }

  late TextEditingController controller;

  final String _url = "";

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

    saveConversation(_conversationEntity!);

    fetchMessages(ctx, _conversationEntity!.id);
  }

  void saveConversation(ConversationEntity conversationEntity) {
    CacheUtil.instance.write("conversation", jsonEncode(conversationEntity.toJson()));
  }

  MessageEntity getItemMessage(int index) {
    return messageList.elementAt(index);
  }

  Future<void> send(BuildContext ctx) async {
    String? model = ctx.read<OpenAIProvider>().openAiModel;
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
    String email = LoginUtil.email;

    controller.clear();

    if (conversationEntity == null) {
      startNewChat(ctx, title: sendText);
    }

    String messageId = const Uuid().v1();
    try {
      MessageEntity messageEntity = MessageEntity()
        ..id = messageId
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
        model: model,
        messages: [
          userMessage,
        ],
        seed: 423,
        n: 2,
      );

      String responseId = const Uuid().v1();

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
              ..fromMessageId = messageId
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
        ..fromMessageId = messageId
        ..conversationId = conversationEntity!.id
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
    String email = LoginUtil.email;
    _conversationEntity = ConversationEntity()
      ..id = const Uuid().v1()
      ..type = 'text'
      ..title = title ?? ''
      ..timestamp = DateTime.timestamp().millisecondsSinceEpoch
      ..belongUid = email;

    addConversation(ctx, conversationEntity!);

    messageList.clear();
    notifyListeners();

    saveConversation(_conversationEntity!);
  }

  fetchMessages(BuildContext ctx, String conversationId) async {
    String email = LoginUtil.email;
    if(email==''){
      return;
    }
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
    FirebaseStoreUtils.add('conversation', conversationEntity.toJson());
  }

  addMessage(BuildContext ctx, MessageEntity messageEntity) async {
    await FirebaseStoreUtils.add('messages', messageEntity.toJson());
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

  void hideConversation(BuildContext context) {
    showConversation = false;
  }

  void hideSetting(BuildContext context) {
    _showSettings = false;
    notifyListeners();
  }
}
