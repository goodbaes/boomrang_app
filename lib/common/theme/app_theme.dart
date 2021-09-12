import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

part 'dark_theme.dart';

part 'light_theme.dart';

part 'elevated_button_theme_data.dart';

part 'extension_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get _baseTheme => ThemeData(
    elevatedButtonTheme: _elevatedButtonThemeData,
    textTheme: _textTheme,
  );

  static ThemeData get darkTheme => _darkTheme();

  static ThemeData get lightTheme => _lightTheme();

  static TextTheme get _textTheme => TextTheme(
        headline1: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
        headline2: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          height: 1,
        ),
        headline3: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
        headline4: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1,
        ),
        headline5: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
        headline6: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
        subtitle1: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          height: 1,
        )
      );
}
