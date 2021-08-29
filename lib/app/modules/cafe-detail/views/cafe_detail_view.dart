import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cafe_detail_controller.dart';

class CafeDetailView extends GetView<CafeDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CafeDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CafeDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
