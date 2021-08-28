import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:boomerang/common/localization/app_localization.dart';
import 'package:boomerang/common/navigation/navigation.dart';
import 'package:boomerang/common/theme/app_theme.dart';
import 'package:boomerang/presentation/app/app_page_controller.dart';
import 'package:boomerang/utils/constants.dart';

class AppPage extends StatefulWidget {
  const AppPage({
    Key? key,
  }) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with WidgetsBindingObserver {
  Rx<Brightness?>? _systemBrightness;
  final _controller = Get.find<AppPageController>(tag: kAppControllerTag);

  @override
  void initState() {
    _systemBrightness =
        SchedulerBinding.instance?.window.platformBrightness.obs;
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _controller.appState.value = state;
    if (state == AppLifecycleState.resumed) {
      _systemBrightness?.value =
          SchedulerBinding.instance?.window.platformBrightness;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        _changeSystemUiOverlayStyle(
          _controller.themeMode.value,
          _systemBrightness?.value,
        );
        return GetMaterialApp(
          translations: AppLocalization(),
          supportedLocales: AppLocalization.supportedLocales,
          localizationsDelegates: AppLocalization.delegates,
          locale: AppLocalization.mainLocale,
          getPages: AppPages.pages,
          initialRoute: AppPages.initPage.name,
          fallbackLocale: AppLocalization.mainLocale,
          themeMode: _controller.themeMode.value,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  void _changeSystemUiOverlayStyle(
    ThemeMode mode,
    Brightness? systemBrightness,
  ) {
    bool isDark = (mode == ThemeMode.system && systemBrightness != null)
        ? systemBrightness == Brightness.dark
        : mode == ThemeMode.dark;

    SystemChrome.setSystemUIOverlayStyle(
      isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );
  }
}
