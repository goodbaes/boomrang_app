import 'package:boomerang/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          LocaleKeys.login_enter_phone_number.tr,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
