import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/data/data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AppPreference _pref = Get.find();
  String text = '';
  @override
  void onReady() {
    super.onReady();
  }
}
