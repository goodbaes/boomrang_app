import 'package:boomerang/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneTextEditController = TextEditingController();
  final isLoading = false.obs;
  final isCode = false.obs;
  final codeReady = false.obs;
  void sendCode() {
    isCode.toggle();
  }

  void enterCode() {
    Get.offAndToNamed(Routes.HOME);
  }

  void sendAgain() {
    isCode.toggle();
  }
}
