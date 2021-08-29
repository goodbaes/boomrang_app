import 'package:boomerang/data/src/dto/src/cafe_model.dart';
import 'package:get/get.dart';

class CafeDetailController extends GetxController {
  late final CafeModel data;
  @override
  void onInit() {
    data = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
