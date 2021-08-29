import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/data/data.dart';
import 'package:boomerang/data/src/dto/src/cafe_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AppPreference _pref = Get.find();
  final tabIndex = 1.obs;
  final shopList = ['', 'Все', 'Китайка', 'KFC'];
  final headerScrollController = ScrollController();
  final cafeList = [
    CafeModel('Social Pizza', 30, 4.4, 2, true, '', p),
    CafeModel('KFC', 20, 4.2, 1, false, '', p)
  ].obs;
  String text = '';
  @override
  void onReady() {
    super.onReady();
  }
}
