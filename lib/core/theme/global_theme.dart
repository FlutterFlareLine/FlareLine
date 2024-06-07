import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTheme {
  static const _lightFillColor = GlobalColors.darkBackgroundColor;
  static const _darkFillColor = GlobalColors.gray;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = theme(lightColorScheme, _lightFocusColor,
      lightAppBarTheme, GlobalColors.darkText, lightCardTheme);
  static ThemeData darkThemeData = theme(darkColorScheme, _darkFocusColor,
      darkAppBarThemd, GlobalColors.darkText, darkCardTheme);

  static ThemeData theme(ColorScheme colorScheme, Color focusColor,
      AppBarTheme appBarTheme, Color hintColor, CardTheme cardTheme) {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        focusColor: focusColor,
        appBarTheme: appBarTheme,
        textTheme: _textTheme,
        hintColor: hintColor,
        cardTheme: cardTheme);
  }

  static CardTheme lightCardTheme = const CardTheme(
    margin: EdgeInsets.zero,
    color: Colors.white,
    surfaceTintColor:  Color(0xFFE2E8F0),
    shadowColor: Color(0x11000000),
    elevation: 0,
  );

  static CardTheme darkCardTheme = CardTheme(
    margin: EdgeInsets.zero,
    color: GlobalColors.darkAppBar,
    surfaceTintColor: GlobalColors.border.withOpacity(0.05),
    shadowColor: GlobalColors.darkAppBar.withOpacity(0.2),
    elevation: 0,
  );

  static const AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
  );

  static const AppBarTheme darkAppBarThemd =
      AppBarTheme(backgroundColor: GlobalColors.sideBar);

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: GlobalColors.primary,
    primaryContainer: GlobalColors.gray,
    secondary: GlobalColors.border,
    secondaryContainer: GlobalColors.border,
    background: GlobalColors.gray,
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: GlobalColors.primary,
    primaryContainer: Colors.white,
    secondary: GlobalColors.primary,
    secondaryContainer: GlobalColors.primary,
    background: GlobalColors.darkBackgroundColor,
    surface: Colors.white,
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    bodySmall: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    titleMedium: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    labelSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyLarge: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    titleSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyMedium: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    titleLarge: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    labelLarge: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );
}
