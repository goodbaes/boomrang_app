import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:boomerang/common/theme/app_colors.dart';

const _minHeight = 50.0;

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final EdgeInsets? paddingText;
  final bool expand;
  final Rx<bool>? isProgress;
  final double? minHeight;

  const DefaultButton({
    Key? key,
    required this.text,
    this.onTap,
    this.margin,
    this.paddingText,
    this.expand = true,
  })  : isProgress = null,
        minHeight = null,
        super(key: key);

  const DefaultButton.withProgress({
    Key? key,
    required this.text,
    this.onTap,
    this.margin,
    this.paddingText,
    this.expand = true,
    required this.isProgress,
    this.minHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).elevatedButtonTheme.style;
    final button = Container(
      constraints: BoxConstraints(minWidth: expand ? double.infinity : 0),
      margin: margin,
      child: ElevatedButton(
        onPressed: onTap,
        child: Padding(
          padding: paddingText ?? EdgeInsets.zero,
          child: Text(text),
        ),
        style: style,
      ),
    );
    if (isProgress == null) return button;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight ?? _minHeight,
      ),
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
