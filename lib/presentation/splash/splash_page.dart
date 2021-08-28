import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:boomerang/common/base/base.dart';
import 'package:boomerang/presentation/splash/splash_controller.dart';
import 'package:boomerang/common/theme/app_theme.dart';
import 'package:boomerang/utils/assets/assets.dart';

part 'splash_bindings.dart';

class SplashPage extends StatelessWidget {
  final SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appIcon = theme.isDark
        ? Assets.images.appIconDarkThemeIcon
        : Assets.images.appIconLightThemeIcon;
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appIcon.image(width: 97, height: 97),
            const SizedBox(height: 20),
            Assets.svg.contactLogo.svg(
              color: theme.textTheme.caption?.color,
            ),
          ],
        ),
      ),
    );
  }
}
