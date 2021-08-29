import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AppPreference _pref = Get.find();
  final tabIndex = 1.obs;
  final shopList = ['', 'Все', 'Китайка', 'KFC'];
  final headerScrollController = ScrollController();
  String text = '';
  @override
  void onReady() {
    super.onReady();
  }
}
