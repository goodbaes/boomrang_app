import 'package:boomerang/app/modules/login/controllers/login_controller.dart';
import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/common/theme/app_colors.dart';
import 'package:boomerang/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part './login_phone_page.dart';
part './login_code_page.dart';
part './login_loading_page.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.darkPurple,
      body: Obx(()=>
        controller.isLoading.value
          ? _LoginLoading()
          : controller.isPhoneSended.value
            ? _LoginCode()
            : _LoginPhone()
      ),
    );
  }

  Widget _buildDescription() {
    final phone = 'Введите номер телефона, чтобы войти или зарегистрироваться';
    final code = 'Вам отправлен код в СМС. Введите его, чтобы войти';
    return Obx(
      () => Text(
        controller.isPhoneSended.value ? code : phone,
      ),
    );
  }
}