import 'package:boomerang/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:boomerang/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FavoritesController>(
      () => FavoritesController(),
    );
  }
}
