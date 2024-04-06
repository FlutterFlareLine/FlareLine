import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = false;

  bool get isDark=>_isDark;

  set isDark(bool dark){
    _isDark = dark;
    notifyListeners();
  }
}