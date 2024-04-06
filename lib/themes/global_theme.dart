import 'package:flareline/themes/global_colors.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> themeMode = ValueNotifier(false);

class GlobalTheme {

  static ThemeData theme(
    BuildContext context,
    bool isDark,
  ) {
    return ThemeData(
        useMaterial3: true,
        primaryColor: primary,
        brightness: isDark ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: isDark ? darkBackgroundColor : gray,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: isDark ? sideBar : Colors.white,
        ),
        hintColor: isDark ? Colors.white : darkText,
        cardTheme: CardTheme.of(context).copyWith(
            margin: EdgeInsets.zero,
            color: isDark ? darkAppBar : Colors.white,
            surfaceTintColor: isDark ? darkAppBar : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: isDark ? 0 : 10,
            shadowColor: gray.withOpacity(0.25)));
  }
}
