import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationProvider extends ChangeNotifier {
  static const Locale en = Locale('en');

  LocalizationProvider() {
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
