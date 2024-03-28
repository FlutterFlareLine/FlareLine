import 'package:flareline/themes/global_colors.dart';
import 'package:flutter/material.dart';

class GlobalTheme {
  static ThemeData theme(
    BuildContext context,
    bool isDark,
  ) {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primary,
        scaffoldBackgroundColor: gray,
        cardTheme: CardTheme.of(context).copyWith(
            margin: EdgeInsets.zero,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 10,
            shadowColor: gray.withOpacity(0.25)));
  }
}
