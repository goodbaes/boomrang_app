import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/data/data.dart';
import 'package:boomerang/data/src/dto/src/cafe_model.dart';
import 'package:boomerang/data/src/dto/src/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AppPreference _pref = Get.find();
  final tabIndex = 1.obs;
  final shopList = ['', 'Все', 'Китайка', 'KFC', 'KFC 1', 'KFC 2', 'KFC 3', 'KFC 4'];
  final headerScrollController = ScrollController();
  final cafeList = [
    CafeModel('Social Pizz', 30, 4.4, 2, true, '', p, '0'),
    CafeModel('KFC', 20, 4.2, 1, false, '', p, '1'),
    CafeModel('Pizza', 30, 4.4, 2, true, '', p, '2'),
    CafeModel('Лагманная', 20, 4.2, 1, false, '', p, '3')
  ].obs;

  final resList = RxList<RestaurantModel>([]);

  String text = '';

  void goToDetail(index) {
    Get.toNamed(Routes.CAFE_DETAIL, arguments: cafeList[index]);
  }

  Future<void> fetchRestaurants() async {
    try {
      var res = await Dio().get<List<dynamic>>('https://backend.boomerang.kg/api/v1/restaurants');
      final List<RestaurantModel> restaurants = res.data!.map<RestaurantModel>((element) {
        return RestaurantModel.fromResponse(element);
      }).toList();
      resList.value = restaurants;
      update();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRestaurants();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
