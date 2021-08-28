import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:boomerang/presentation/app/app_page_controller.dart';
import 'package:boomerang/utils/constants.dart';

mixin AppStateMixin on GetxController {
  LightSubscription<AppLifecycleState>? _appStateSubscription;

  @override
  void onInit() {
    super.onInit();
    _appStateSubscription = Get.find<AppPageController>(tag: kAppControllerTag)
        .appState
        .subject
        .listen((state) {
      switch (state) {
        case AppLifecycleState.resumed:
          onResume();
          break;
        case AppLifecycleState.inactive:
          onInactive();
          break;
        case AppLifecycleState.paused:
          onPaused();
          break;
        case AppLifecycleState.detached:
          onDetached();
          break;
      }
    });
  }

  void onInactive() {}

  void onResume() {}

  void onPaused() {}

  void onDetached() {}

  @override
  void onClose() {
    _appStateSubscription?.cancel();
    _appStateSubscription = null;
    super.onClose();
  }
}
