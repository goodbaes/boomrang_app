import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'default_button.dart';

void bottomSheet(child) {
  Get.bottomSheet(CustomBottomSheet(child));
}

class CustomBottomSheet extends StatefulWidget {
  final Widget child;
  const CustomBottomSheet(this.child, {Key? key}) : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      child: Center(
        child:
            Padding(padding: const EdgeInsets.all(16.0), child: widget.child),
      ),
    );
  }
}
