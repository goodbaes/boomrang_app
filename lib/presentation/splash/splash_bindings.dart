part of 'splash_page.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(
          Get.find(),
          Get.find(),
        ));
  }
}
