import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/data/data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AppPreference _pref = Get.find();
  String text = '';
  @override
  void onReady() {
    // print('qwe');
    // print(_pref.userPhone.val);
    Get.snackbar('title', 'message');
    if (_pref.userPhone.val == '') Get.offAndToNamed(Routes.LOGIN);
    super.onReady();
  }
}
