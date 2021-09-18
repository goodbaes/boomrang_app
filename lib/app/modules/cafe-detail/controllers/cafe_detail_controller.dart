import 'dart:async';

import 'package:boomerang/data/src/dto/src/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CafeDetailController extends GetxController {
  late final RestaurantModel data;
  final color = Rx(Colors.white);
  trigger() {
    color.value = Colors.transparent;
  }

  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    data = Get.arguments[0];
    super.onInit();
  }

  var stream = StreamController();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
