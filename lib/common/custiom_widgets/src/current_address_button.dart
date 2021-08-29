import 'package:boomerang/common/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentAddressButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final EdgeInsets? paddingText;
  final bool expand;
  final Rx<bool>? isProgress;
  final double? minHeight;
  final Colors? color;
  const CurrentAddressButton({
    Key? key,
    required this.text,
    this.onTap,
    this.margin,
    this.icon,
    this.color,
    this.paddingText,
    this.expand = true,
  })  : isProgress = null,
        minHeight = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).elevatedButtonTheme.style;

    final button = Container(
      constraints: BoxConstraints(minWidth: expand ? double.infinity : 0),
      margin: margin,
      child: MaterialButton(
        color: Get.theme.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Get.theme.textTheme.bodyText1!.color,
              ),
            Text(
              ' ' + text,
              style: Get.theme.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
    if (isProgress == null) return button;
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: Center(
        child: Obx(
          () => isProgress!.value
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.mainBlue),
                )
              : button,
        ),
      ),
    );
  }
}
