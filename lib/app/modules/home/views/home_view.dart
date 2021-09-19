import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/common/custiom_widgets/src/add_address_sheet.dart';
import 'package:boomerang/common/custiom_widgets/src/cafe_card_widget.dart';
import 'package:boomerang/common/custiom_widgets/src/naviagtion_drawer.dart';
import 'package:boomerang/data/src/dto/src/restaurant_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: _buildAppbar(),
      body: _buildNested(
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildResCatsContainer(), _buildResList()],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))],
      title: CurrentAddressButton(
        icon: Icons.gps_fixed,
        text: 'Введите ваш адрес',
        onTap: () {
          bottomSheet(AddAddressWidget([]));
        },
      ),
      centerTitle: true,
    );
  }

  NestedScrollView _buildNested(child) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false, //? Disable Drawer Button in the sliver app
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

  Widget _buildResList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RefreshIndicator(
          onRefresh: controller.refreshData,
          child: Obx(()=>
            ListView.builder(
              itemCount: controller.filteredResList.length,
              itemBuilder: (context, index) {
                return CafeCardWidget(
                  data: controller.filteredResList[index], 
                  onTap: () => controller.goToDetail(controller.filteredResList[index]),
                );
              },
            )
          )
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

  Widget _buildResCatsContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 40,
        child: Obx(() => 
          ListView.builder(
            itemCount: controller.resCatsList.length,
            controller: controller.headerScrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _resCatsButton(controller.resCatsList[index]),
          ),
        ),
      ),
    );
  }

  Widget _resCatsButton(ResCatsModel item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Obx(()=> 
        MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 40,
          minWidth: 0,
          color: controller.selectedResCatId.value == item.id
            ? Get.theme.accentColor
            : Color(0xFFF2F2F2),
          onPressed: () => controller.selectedResCat = item,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            child: Text(item.name)),
        )
      ),
    );
  }
}
