import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';


class GlobalTheme {

  static ThemeData theme(
    BuildContext context,
    bool isDark,
  ) {
    return ThemeData(
        useMaterial3: true,
        primaryColor: GlobalColors.primary,
        brightness: isDark ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: isDark ? GlobalColors.darkBackgroundColor : GlobalColors.gray,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: isDark ? GlobalColors.sideBar : Colors.white,
        ),
        hintColor: isDark ? Colors.white : GlobalColors.darkText,
        cardTheme: CardTheme.of(context).copyWith(
            margin: EdgeInsets.zero,
            color: isDark ? GlobalColors.darkAppBar : Colors.white,
            surfaceTintColor: isDark ? GlobalColors.darkAppBar : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: isDark ? 0 : 10,
            shadowColor: GlobalColors.gray.withOpacity(0.25)));
  }
}
