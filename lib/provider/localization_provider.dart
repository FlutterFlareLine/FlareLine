import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LocalizationProvider extends ChangeNotifier{
  static const Locale en = Locale('en');

  Locale _locale = const Locale.fromSubtags(languageCode: 'en');

  Locale get locale {
    notifyListeners();
    return _locale;
  }

  List<Locale> get supportedLocales => [en];

  late Map<String, dynamic> _localizedString;

  Future<bool> load() async {
    try {
      String jsonString = await rootBundle
          .loadString('assets/localization/${locale.languageCode}.json');
      _localizedString = jsonDecode(jsonString);
      return true;
    } catch (e) {
      return false;
    }
  }
}