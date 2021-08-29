import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/common/custiom_widgets/src/add_address_sheet.dart';
import 'package:boomerang/common/custiom_widgets/src/cafe_card_widget.dart';
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
        title: SizedBox(
          child: CurrentAddressButton(
            icon: Icons.gps_fixed,
            text: 'Введите ваш адрес',
            onTap: () {
              bottomSheet(AddAddressWidget([]));
            },
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            _buildTitle(),
            _buildListViewHeader(),
            _buildListCafeCard()
          ],
        ),
      ),
    );
  }

  Widget _buildListCafeCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return CafeCardWidget(controller.cafeList[index]);
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Рестораны',
        style: Get.theme.textTheme.headline3,
      ),
    );
  }

  Widget _buildListViewHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 40,
        child: ListView.builder(
          itemCount: controller.shopList.length,
          controller: controller.headerScrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => buildPaddingHeaderCard(index),
        ),
      ),
    );
  }

  Widget buildPaddingHeaderCard(int index) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 40,
          minWidth: 0,
          color: controller.tabIndex.value == index
              ? Get.theme.accentColor
              : Color(0xFFF2F2F2),
          onPressed: () => controller.tabIndex.value = index,
          child: Container(
              alignment: Alignment.center,
              height: 40,
              child: index == 0
                  ? Icon(Icons.favorite_border_outlined)
                  : Text("${controller.shopList[index]} $index")),
        ),
      ),
    );
  }
}
