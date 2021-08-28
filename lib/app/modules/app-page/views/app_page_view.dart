import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/common/localization/app_strings.dart';
import 'package:boomerang/common/theme/app_theme.dart';
import 'package:boomerang/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/app_page_controller.dart';

class AppPageView extends GetView<AppPageController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Бумеранг",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: Get.deviceLocale,
      translations: AppStrings(),
      fallbackLocale: Locale('ru_RU'),
    );
  }
}
