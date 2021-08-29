import 'package:boomerang/common/theme/app_colors.dart';
import 'package:boomerang/data/src/dto/src/cafe_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

const String p =
    'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

class CafeCardWidget extends StatelessWidget {
  final CafeModel data;
  final Callback onTap;
  const CafeCardWidget(
    this.data,
    this.onTap, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

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

  Text _buildName() => Text(data.name, style: Get.theme.textTheme.headline4);

  Container _buildImg() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: NetworkImage(data.img ?? p), fit: BoxFit.cover)),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: data.isFavor ? _favorButton() : _notFavorButton(),
          )
        ],
      ),
    );
  }

  ElevatedButton _notFavorButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.favorite_border_rounded, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: Colors.transparent,
        onPrimary: Colors.red,
      ),
    );
  }

  ElevatedButton _favorButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.favorite, color: Colors.red),
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
