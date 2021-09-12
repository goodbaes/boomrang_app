import 'package:boomerang/app/routes/app_pages.dart';
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
      appBar: _buildAppbar(),
      body: _buildNested(
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildListViewHeader(), _buildListCafeCard()],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))],
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
    );
  }

  NestedScrollView _buildNested(child) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: true,
            pinned: false,
            flexibleSpace: Container(
              alignment: Alignment.centerLeft,
              child: _buildTitle()
            ),
          ),
        ];
      },
      body: Center(
        child: child,
      ),
    );
  }

  Widget _buildListCafeCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: controller.resList.length,
          itemBuilder: (context, index) {
            return CafeCardWidget(
              data: controller.resList[index], 
              onTap: () => controller.goToDetail(index),
            );
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
        style: Get.theme.textTheme.headline1
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
          // onPressed: () => controller.tabIndex.value = index,
          onPressed: () => controller.fetchRestaurants(),
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
