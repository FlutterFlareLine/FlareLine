
import 'package:dart_openai/dart_openai.dart';
import 'package:flareline/entity/message_entity.dart';
import 'package:flareline/provider/base_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ChatGptProvider extends BaseProvider {
  late TextEditingController controller;

  String _url = "";

  String get url => _url;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _showSettings = false;

  bool get showSettings => _showSettings;

  List<MessageEntity> messageList = [];

  int get messageCount => messageList.length;

  ChatGptProvider(BuildContext ctx) {
    controller = TextEditingController();
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

    try {
      messageList.add(new MessageEntity()
        ..id = Uuid().v1()
        ..isUser = true
        ..content = sendText
        ..timestamp = DateTime.timestamp()
        ..belongUid = email);
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
            MessageEntity responseMessage = new MessageEntity()
              ..id = responseId
              ..isUser = false
              ..content = msgText
              ..timestamp = DateTime.timestamp()
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
        },
      );
    } catch (e) {
      MessageEntity responseMessage = new MessageEntity()
        ..id = Uuid().v1()
        ..isUser = false
        ..content = e.toString()
        ..timestamp = DateTime.timestamp()
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
}
