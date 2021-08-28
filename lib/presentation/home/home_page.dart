import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: DefaultButton(
          text: 'Hello',
        ),
      ),
    );
  }
}
