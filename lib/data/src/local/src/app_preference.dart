import 'package:flutter/material.dart' show ThemeMode;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const _themeModeKey = 'theme_mode';
const _tokenKey = 'token';
const _userPhone = 'user_phone';
const _userPassword = 'user_password';

class AppPreference extends GetxService {
  final GetStorage _storage;

  AppPreference(this._storage);

  ThemeMode get themeMode =>
      ThemeMode.values[_storage.read(_themeModeKey) ?? ThemeMode.system.index];

  late Rx<ThemeMode> themeModeRx = themeMode.obs;

  String get token => _storage.read(_tokenKey) ?? '';

  late Rx<String> tokenRx = token.obs;

  late final ReadWriteValue<String> userPhone = ''.val(
    _userPhone,
    getBox: () => _storage,
  );

  late final ReadWriteValue<String> userPassword = ''.val(
    _userPassword,
    getBox: () => _storage,
  );

  void updateThemeMode(ThemeMode mode) {
    _storage.write(_themeModeKey, mode.index);
    themeModeRx.value = mode;
  }

  void updateToken(String token) {
    _storage.write(_tokenKey, token);
    tokenRx.value = token;
  }
}
