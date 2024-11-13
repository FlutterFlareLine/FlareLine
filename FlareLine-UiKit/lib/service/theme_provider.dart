import 'package:flareline_uikit/core/mvvm/base_viewmodel.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends BaseViewModel {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeProvider(super.context);

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleThemeMode() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  @override
  void init(BuildContext context) {
    // TODO: implement init
  }
}
