import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/common/custiom_widgets/src/add_address_sheet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(
            text: 'asd',
            onTap: () {
              bottomSheet(AddAddressWidget([]));
            },
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
