import 'package:dart_openai/dart_openai.dart';
import 'package:flareline/provider/firebase_store_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ChatGptProvider extends ChangeNotifier {
  late TextEditingController controller;
  late TextEditingController keyController;
  late TextEditingController proxyController;

  String _url = "";

  String get url => _url;

  String _text = "";

  String get text => _text;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _checkedId;

  List<OpenAIModelModel>? _models;

  List<OpenAIModelModel> get models => _models ?? [];

  ChatGptProvider(BuildContext ctx) {
    controller = TextEditingController();
    keyController = TextEditingController();
    proxyController = TextEditingController();

    initOpenApiConfig(ctx);
  }

  set checkedId(String? cid) {
    _checkedId = cid;
    notifyListeners();
  }

  bool isChecked(String id) {
    return _checkedId == id;
  }

  Future<void> startScrapy(BuildContext ctx) async {
    if (_checkedId == null) {
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
        model: _checkedId!,
        messages: [
          userMessage,
        ],
        seed: 423,
        n: 2,
      );

      chatStream.listen(
        (streamChatCompletion) {
          final content = streamChatCompletion.choices.first.delta.content;

          _text += content?.map((e) => e?.text??'').toList().join('') ?? '';
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

  saveKey(BuildContext ctx) {
    if (keyController.text.isEmpty) {
      SnackBarUtil.showSnack(ctx, 'please enter your key');
      return;
    }
    String openAiKey = 'openAiKey';
    String email = ctx.read<StoreProvider>().email;

    Map<String, dynamic> data = {
      'email': email,
      'key': keyController.text.trim(),
      'api': proxyController.text.trim(),
    };
    ctx.read<FirebaseStoreProvider>().save(openAiKey, email, data);
    initOpenApiConfig(ctx);
    SnackBarUtil.showSuccess(ctx, 'key saved success');
  }

  Future<Map<String, dynamic>?> getOpenApiConfig(BuildContext ctx) async {
    String email = ctx.read<StoreProvider>().email;
    Map<String, dynamic>? data =
        await ctx.read<FirebaseStoreProvider>().getOne('openAiKey', email);
    return data;
  }

  Future<void> initOpenApiConfig(BuildContext ctx) async {
    Map<String, dynamic>? config = await getOpenApiConfig(ctx);
    if (config != null) {
      String key = config['key'];
      String proxy = config['api'];

      keyController.text = config['key'];
      proxyController.text = proxy;

      OpenAI.apiKey = key;
      OpenAI.baseUrl = proxy;
      OpenAI.showLogs = kDebugMode;
      OpenAI.showResponsesLogs = kDebugMode;

      _models = await OpenAI.instance.model.list();
      notifyListeners();
    }
  }
}
