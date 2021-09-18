import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/common/theme/app_colors.dart';
import 'package:boomerang/data/src/dto/src/restaurant_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cafe_detail_controller.dart';

class CafeDetailView extends GetView<CafeDetailController> {
  RestaurantModel get data => controller.data;
  List<Widget> lw = List.generate(
      20,
      (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.green,
              height: 100 - index.toDouble(),
            ),
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
              tag: "Res#${data.id}.preview",
              child: CustomCachedNetworkImage(
                url: controller.data.preview,
              )),
          Center(
            child: NotificationListener(
              onNotification: (ScrollNotification n) {
                print(n.metrics.atEdge);
                return true;
              },
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: 200.0,
                    onStretchTrigger: controller.trigger(),
                    stretchTriggerOffset: 20,
                    backgroundColor: controller.color.value,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text('SliverAppBar')),
                      background: _buildTopContent(),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Material(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                        child: Column(
                          children: lw,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // body: Center(
      //   child: Column(
      //     children: [
      //       Flexible(
      //         fit: FlexFit.tight,
      //         child: SizedBox(child: Text('asd')),
      //         flex: 37,
      //       ),
      //       Flexible(
      //           flex: 63,
      //           child: Stack(
      //             fit: StackFit.expand,
      //             children: [
      //               Material(
      //                 color: Colors.white,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(16.0),
      //                 ),
      //               ),
      //             ],
      //           ))
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildTopContent() {
    return Container(
      width: Get.width,
      height: Get.height / 3,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 48, 8.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.white,
                    onPrimary: Get.theme.accentColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildName(),
                    _buildChips(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName() => Hero(
      tag: "Res#${data.id}.title",
      child: Text(data.name,
          style: Get.theme.textTheme.headline1?.copyWith(color: Colors.white)));

  Widget _buildChips() => Row(
        children: [
          _buildChipWithIcon(
              Icon(Icons.car_repair, color: Get.theme.accentColor), '60 мин.'),
          _buildChipWithIcon(Icon(Icons.star, color: AppColors.secondaryYellow),
              (data.rating == 0 ? 'N/R' : data.rating).toString()),
          _buildChipWithIcon(
              Icon(Icons.track_changes, color: AppColors.secondaryBlack),
              '3 km.'),
        ],
      );

  Widget _buildChipWithIcon(icon, text) {
    return ChipInfoWidget(icon, text).paddingOnly(right: 8);
  }
}
