import 'package:boomerang/domain/src/repositories/src/app_settings_repository.dart';
import 'package:get/get.dart';

class AppPageController extends GetxController {
  AppSettingsRepository _appSettingsRepo = Get.find();
  late final themeMode = _appSettingsRepo.getThemeModeRx();
}
