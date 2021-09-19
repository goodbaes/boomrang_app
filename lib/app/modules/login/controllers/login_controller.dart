import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/data/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:boomerang/utils/constants.dart';

class LoginController extends GetxController {
  final phoneTextEditController = TextEditingController();
  final code = ''.obs;
  final isLoading = false.obs;
  final isPhoneSended = false.obs;
  final codeReady = false.obs;
  final isUserLoggedIn = false.obs;

  final AppPreference _pref = Get.find();


  Future<void> sendPhone() async {
    try {
      isLoading.value = true;
      final phone = phoneTextEditController.value.text;
      final Map<String, String> data = {
        'phone': phone,
      };
      print("Phone: $phone");
      var res = await Dio().post('$kApiUrl/rest-auth/registration-otp/', data: data);
      print(res.data);
      isLoading.value = false;
      _pref.userPhone.val = phone;
      isPhoneSended.toggle();
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }


  Future<void> enterCode() async {
    try {
      isLoading.value = true;
      final phone = _pref.userPhone.val;
      final Map<String, String> data = {
        'phone': phone,
        'code': code.value,
      };
      print("Phone: $phone");
      var res = await Dio().post('$kApiUrl/rest-auth/verification-otp/', data: data);
      print(res.data);
      isLoading.value = false;
      _pref.updateTokens(
        access: res.data['access'] as String,
        refresh: res.data['refresh'] as String,
      );
      isUserLoggedIn.value = true;
      Get.offAndToNamed(Routes.HOME);
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  enterPhoneAgain(){
    isPhoneSended.toggle();
  }

  logout(){
    isPhoneSended.value = false;
    _pref.userPhone.val = '';
    codeReady.value = false;
    isUserLoggedIn.value = false;
    Get.offAndToNamed(Routes.LOGIN);
  }

  Future<void> sendAgain() async {
    try {
      isLoading.value = true;
      final phone = _pref.userPhone.val;
      final Map<String, String> data = {
        'phone': phone,
      };
      await Dio().post('$kApiUrl/rest-auth/registration-otp/', data: data);
      isLoading.value = false;
      isPhoneSended.toggle();
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    isUserLoggedIn.value = _pref.userPhone.val == '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    phoneTextEditController.value = TextEditingValue(text: '+996 ');
    // if(!Get.isDarkMode){
    //   Get.changeThemeMode(ThemeMode.dark);
    // }
  }
}
