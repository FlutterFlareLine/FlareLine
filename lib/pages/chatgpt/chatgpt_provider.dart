import 'package:dart_openai/dart_openai.dart';
import 'package:flareline/pages/setting/open_ai_setting.dart';
import 'package:flareline/provider/firebase_store_provider.dart';
import 'package:flareline/provider/openai_setting_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ChatGptProvider extends ChangeNotifier {
  late TextEditingController controller;

  String _url = "";

  String get url => _url;

  String _text = "";

  String get text => _text;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _showSettings = false;

  bool get showSettings => _showSettings;

  ChatGptProvider(BuildContext ctx) {
    controller = TextEditingController();
  }

  Future<void> send(BuildContext ctx) async {
    String? model = ctx.read<OpenAISettingProvider>().checkedId;
    if (model == null) {
      SnackBarUtil.showSnack(ctx, 'please select model');
      return;
    }
    if (controller.text.isEmpty) {
      SnackBarUtil.showSnack(ctx, 'please input target url');
      return;
    }

    // _isLoading = true;
    // notifyListeners();
    String url = controller.text.trim();

    try {
      _text = '';
      notifyListeners();

      // The user message to be sent to the request.
      final userMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            url,
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

      chatStream.listen(
        (streamChatCompletion) {
          final content = streamChatCompletion.choices.first.delta.content;

          _text += content?.map((e) => e?.text ?? '').toList().join('') ?? '';
          notifyListeners();
          debugPrint(_text);
        },
        onDone: () {
          debugPrint("Done");
          // _isLoading = false;
          // notifyListeners();
        },
      );
    } catch (e) {
      _text = e.toString();
      // _isLoading = false;
      notifyListeners();
    }
  }

  void toggleSetting(BuildContext ctx) {
    _showSettings = !_showSettings;
    notifyListeners();
  }
}
