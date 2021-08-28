import 'package:flutter/material.dart' show Locale;
import '../app_localization.dart';

abstract class BaseLocale {
  const BaseLocale();

  Locale get locale;

  Map<ALKeys, String> get translateMap;
}
