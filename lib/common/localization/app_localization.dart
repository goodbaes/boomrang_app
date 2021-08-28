import 'package:flutter/material.dart' show Locale, LocalizationsDelegate;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'translations/base_locale.dart';

part 'translations/locale_ru.dart';

part 'app_localization_keys.dart';

class AppLocalization extends Translations {
  static List<BaseLocale> _locales = [
    const LocaleRU(),
  ];

  static Locale get mainLocale => LocaleRU().locale;

  static List<Locale> get supportedLocales =>
      _locales.map((e) => e.locale).toList();

  static List<LocalizationsDelegate<dynamic>> delegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  @override
  Map<String, Map<String, String>> get keys => Map.fromEntries(
        _locales.map(
          (e) => MapEntry(
            e.locale.toString(),
            e.translateMap.map((k, v) => MapEntry(k.name, v)),
          ),
        ),
      );
}
