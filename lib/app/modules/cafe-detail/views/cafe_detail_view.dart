import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cafe_detail_controller.dart';

class CafeDetailView extends GetView<CafeDetailController> {
  get data => controller.data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildTopContent(),
              Expanded(
                child: Column(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: SizedBox(child: Text('asd')),
                      flex: 37,
                    ),
                    Flexible(
                        flex: 63,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Material(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildTopContent() {
    return Column(
      children: [
        Flexible(
          flex: 40,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomCachedNetworkImage(
                url: controller.data.img ?? '',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child:
                          Icon(Icons.arrow_back_ios_new, color: Colors.black),
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
        ),
        Flexible(
          flex: 60,
          child: SizedBox(),
        )
      ],
    );
  }

  Container _buildCorners() {
    return Container(
      height: 20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          )),
    );
  }

  Text _buildName() => Text(data.name, style: Get.theme.textTheme.headline4);

  Widget _buildChips() => Row(
        children: [
          _buildChipWithIcon(
              Icon(Icons.car_repair, color: Get.theme.accentColor),
              data.deliveryTime.toString() + ' мин.'),
          _buildChipWithIcon(Icon(Icons.star, color: AppColors.secondaryYellow),
              (data.rating == 0 ? 'N/R' : data.rating).toString()),
          _buildChipWithIcon(
              Icon(Icons.track_changes, color: AppColors.secondaryBlack),
              data.km.toString() + ' km.'),
        ],
      );

  Widget _buildChipWithIcon(icon, text) {
    return ChipInfoWidget(icon, text).paddingOnly(right: 8);
  }
}
