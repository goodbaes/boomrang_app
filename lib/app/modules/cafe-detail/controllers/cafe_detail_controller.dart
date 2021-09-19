import 'package:boomerang/data/src/dto/src/restaurant_model.dart';
import 'package:get/get.dart';

class CafeDetailController extends GetxController {
  late final RestaurantModel data;

  @override
  void onInit() {
    data = Get.arguments[0];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
