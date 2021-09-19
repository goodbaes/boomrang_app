import 'package:boomerang/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:boomerang/common/theme/app_colors.dart';
// import 'package:boomerang/data/src/dto/src/cafe_model.dart';
import 'package:boomerang/data/src/dto/src/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../custom_widgets.dart';

const String p =
    'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

class CafeCardWidget extends StatelessWidget {
  final RestaurantModel data;
  final Callback onTap;

  final FavoritesController favController = Get.find();

  CafeCardWidget(
    {
      required this.onTap,
      required this.data,
      Key? key
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImg(),
            _buildName(),
            _buildChips(),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChips() => Row(
        children: [
          _buildChipWithIcon(
              Icon(Icons.car_repair, color: Get.theme.accentColor),
              '60 мин.'),
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

  Widget _buildName(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 5),
      child: Hero(
        tag: "Res#${data.id}.title",
        child: Text(
          data.name, 
          style: Get.theme.textTheme.headline2
        )
      )
    );
  }

  Container _buildImg() {
    return Container(
      width: Get.width,
      height: 200,
      child: Stack(
        children: [
          Container(
            width: Get.width,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Hero(
                tag: "Res#${data.id}.preview",
                child: CustomCachedNetworkImage(
                  url: data.preview,
                )
              )
            )
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: _favorButton(),
          )
        ],
      ),
    );
  }

  Widget _favorButton() {
    return ElevatedButton(
      onPressed: () => favController.toggleFavorite(data.id),
      child: Obx(()=>
        favController.favorites.contains(data.id)
          ? Icon(Icons.favorite, color: Colors.red)
          : Icon(Icons.favorite_border_rounded, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: Colors.transparent,
        onPrimary: Colors.red,
      ),
    );
  }
}

class ChipInfoWidget extends StatelessWidget {
  final Icon icon;
  final String text;
  const ChipInfoWidget(
    this.icon,
    this.text,
  );
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        children: [icon, Text(text)],
      ),
    );
  }
}
