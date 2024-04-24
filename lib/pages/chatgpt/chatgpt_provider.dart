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

      OpenAI.apiKey = key;
      OpenAI.baseUrl = proxy;
      OpenAI.showLogs = kDebugMode;
      OpenAI.showResponsesLogs = kDebugMode;
      OpenAI.includeHeaders({
        'User-Agent':
            'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.0; +https://openai.com/gptbot)'
      });

      _models = await OpenAI.instance.model.list();
      if (models.isNotEmpty) {
        checkedId = models[0].id;
      }
      notifyListeners();
    }
  }
}
