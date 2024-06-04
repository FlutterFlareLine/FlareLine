import 'package:dart_openai/dart_openai.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline/utils/firebase_store_utils.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpenAIProvider extends BaseProvider {
  OpenAIProvider(super.context);

  @override
  void init(BuildContext context) {
    keyController = TextEditingController();
    proxyController = TextEditingController();
  }

  late TextEditingController keyController;
  late TextEditingController proxyController;
  List<OpenAIModelModel>? _models;

  List<OpenAIModelModel> get models => _models ?? [];

  String? _checkedId;

  String get checkedId => _checkedId ?? 'gpt-3.5-turbo';

  set checkedId(String? cid) {
    _checkedId = cid;
    notifyListeners();
  }

  bool isChecked(String id) {
    return checkedId == id;
  }

  saveKey(BuildContext ctx) {
    if (keyController.text.isEmpty) {
      SnackBarUtil.showSnack(ctx, 'please enter your key');
      return;
    }
    String email = ctx.read<StoreProvider>().email;
    if(email==''){
      return;
    }
    Map<String, dynamic> data = {
      'email': email,
      'usedModel': checkedId,
      'key': keyController.text.trim(),
      'api': proxyController.text.trim(),
    };
    ctx.read<StoreProvider>().saveOpenAi(data);
    initOpenApiConfig(ctx);
    SnackBarUtil.showSuccess(ctx, 'key saved success');
  }

  Future<Map<String, dynamic>?> getDemoOpenAiConfigKey(BuildContext ctx) async {
    String email = 'demo@flareline.com';
    Map<String, dynamic>? data =
        await FirebaseStoreUtils.getOne('openAiKey', email);
    return data;
  }

  Future<void> initOpenApiConfig(BuildContext ctx) async {
    Map<String, dynamic>? config = ctx.read<StoreProvider>().openAiConfig;
    config ??= await getDemoOpenAiConfigKey(ctx);

    _checkedId = ctx.read<StoreProvider>().openAiModel;

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
        if (_checkedId == null) {
          _checkedId = models[0].id;
        }
      }
      notifyListeners();
    }
  }
}
