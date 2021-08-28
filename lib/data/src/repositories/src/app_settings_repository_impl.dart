import 'package:flutter/material.dart' show ThemeMode;
import 'package:get/get_rx/src/rx_types/rx_types.dart' show Rx;
import 'package:boomerang/data/data.dart';
import 'package:boomerang/domain/domain.dart';

class AppSettingsRepositoryImpl extends AppSettingsRepository {
  final AppPreference _pref;

  AppSettingsRepositoryImpl(this._pref);

  @override
  ThemeMode getThemeMode() => _pref.themeMode;

  @override
  Rx<ThemeMode> getThemeModeRx() => _pref.themeModeRx;

  @override
  void updateThemeMode(ThemeMode mode) => _pref.updateThemeMode(mode);
}
