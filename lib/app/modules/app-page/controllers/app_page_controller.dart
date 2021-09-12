import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/data/data.dart';
import 'package:boomerang/domain/src/repositories/src/app_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPageController extends GetxController {
  AppPreference _pref = Get.find();
  AppSettingsRepository _appSettingsRepo = Get.find();
  late final themeMode = _appSettingsRepo.getThemeModeRx();

  String initialRoute() {
    return _pref.userPhone.val == '' ? Routes.LOGIN : Routes.HOME;
  }
}
