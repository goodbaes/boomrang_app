import 'package:flutter/material.dart' show ThemeMode;
import 'package:get/get_rx/get_rx.dart' show Rx;

abstract class AppSettingsRepository {
  ThemeMode getThemeMode();

  Rx<ThemeMode> getThemeModeRx();

  void updateThemeMode(ThemeMode mode);
}
