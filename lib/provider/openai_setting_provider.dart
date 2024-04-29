import 'package:dart_openai/dart_openai.dart';
import 'package:flareline/provider/firebase_store_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpenAISettingProvider extends ChangeNotifier {
  OpenAISettingProvider(BuildContext ctx) {
    keyController = TextEditingController();
    proxyController = TextEditingController();
    initOpenApiConfig(ctx);
  }

  late TextEditingController keyController;
  late TextEditingController proxyController;
  List<OpenAIModelModel>? _models;

  List<OpenAIModelModel> get models => _models ?? [];

  String? _checkedId;

  String? get checkedId => _checkedId;

  set checkedId(String? cid) {
    _checkedId = cid;
    notifyListeners();
  }

  bool isChecked(String id) {
    return _checkedId == id;
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
      'usedModel': _checkedId,
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
      OpenAI.includeHeaders({
        'User-Agent':
        'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.0; +https://openai.com/gptbot)'
      });

      _models = await OpenAI.instance.model.list();
      if (models.isNotEmpty) {
        checkedId = config['usedModel'];
        if (checkedId == null) {
          checkedId = models[0].id;
        }
      }
      notifyListeners();
    }
  }
}