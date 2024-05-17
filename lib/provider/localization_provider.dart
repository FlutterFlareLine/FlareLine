import 'dart:convert';
import 'dart:ui';

import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationProvider extends BaseProvider {
  static const Locale en = Locale('en');

  LocalizationProvider(super.context);

  @override
  void init(BuildContext context) {
    String? languageCode = box.read("locale");
    if (languageCode != null) {
      _locale = Locale.fromSubtags(languageCode: languageCode);
    }
  }

  Locale? _locale;

  Locale get locale => _locale ?? const Locale.fromSubtags(languageCode: 'en');

  String get languageCode => locale.languageCode;

  final box = GetStorage();

  set locale(Locale locale) {
    _locale = locale;
    box.write("locale", locale.languageCode);
    notifyListeners();
  }


}
