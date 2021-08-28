import 'package:flutter/material.dart';
import 'package:boomerang/utils/constants.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? body;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final EdgeInsets? marginContent;
  final WillPopCallback? onWillPop;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;

  const BaseScaffold({
    Key? key,
    this.body,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    this.marginContent,
    this.onWillPop,
    this.bottomNavigationBar,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: key,
        appBar: appBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(
          child: Container(
            child: body,
            margin: marginContent ??
                const EdgeInsets.symmetric(horizontal: kDefaultMarginContent),
          ),
        ),
      ),
    );
  }
}
