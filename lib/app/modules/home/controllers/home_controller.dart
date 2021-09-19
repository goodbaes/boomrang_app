import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
// import 'package:boomerang/data/data.dart';
import 'package:boomerang/data/src/dto/src/cafe_model.dart';
import 'package:boomerang/data/src/dto/src/restaurant_model.dart';
import 'package:boomerang/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // AppPreference _pref = Get.find();
  final tabIndex = 1.obs;
  final headerScrollController = ScrollController();

  final RxList<RestaurantModel> resList = RxList<RestaurantModel>([]);
  final RxList<RestaurantModel> filteredResList = RxList<RestaurantModel>([]);
  final RxList<ResCatsModel> resCatsList = RxList<ResCatsModel>([]);
  final RxInt selectedResCatId = (-1).obs;

  ResCatsModel? resCatById(int id) => resCatsList.firstWhere((resCat) => resCat.id == id);
  ResCatsModel? get selectedResCat => resCatById(selectedResCatId.value);
  set selectedResCat(ResCatsModel? newVal){
    selectedResCatId.value = newVal?.id ?? -1;
    if(newVal!=null){
      filteredResList.value = resList.where((res)=>
        res.restaurantCategories
          .where((resCat) => resCat.id == newVal.id)
          .isNotEmpty
      ).toList();
      update();
    }else{
      filteredResList.value = resList.map((element) => element).toList();
      update();
    }
    print("Filtered Res List:");
    print(filteredResList);
  }

  void goToDetail(RestaurantModel item) {
    Get.toNamed(Routes.CAFE_DETAIL, arguments: [item]);
  }

  Future<void> fetchRestaurants() async {
    try {
      var res = await Dio().get<List<dynamic>>('$kApiUrl/restaurants/');
      final List<RestaurantModel> restaurants = res.data!.map<RestaurantModel>((element) {
        return RestaurantModel.fromResponse(element);
      }).toList();
      print(restaurants);
      resList.value = restaurants;
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchCategories() async {
    try {
      var res = await Dio().get<List<dynamic>>('$kApiUrl/categories/restaurant-categories/');
      final List<ResCatsModel> resCats = res.data!.map<ResCatsModel>((element) {
        return ResCatsModel.fromResponse(element);
      }).toList();
      print(resCats);
      resCatsList.value = resCats;
      selectedResCat = null;
    } catch (e) {
      print(e);
    }
  }

  Future<void> refreshData() async {
    await Future.wait([
      fetchCategories(),
      fetchRestaurants(),
    ]);
  }

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
    fetchCategories();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
