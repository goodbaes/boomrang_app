import 'package:boomerang/app/modules/login/controllers/login_controller.dart';
import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:boomerang/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 16),
          _buildDescription(),
          SizedBox(height: 16),
          _PhoneLogin(
            onLogin: (String value) {},
            loginController: controller,
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    final phone = 'Введите номер телефона, чтобы войти или зарегистрироваться';
    final code = 'Вам отправлен код в СМС. Введите его, чтобы войти';
    return Obx(
      () => Text(
        controller.isCode.value ? code : phone,
      ),
    );
  }
}

class _PhoneLogin extends StatelessWidget {
  late Function onLogin;
  late LoginController loginController;
  _PhoneLogin({required this.onLogin, required this.loginController});

  _border() => OutlineInputBorder(
      borderSide: BorderSide(color: Get.theme.focusColor.withOpacity(1)));
  _focusedBorder() => OutlineInputBorder(
      borderSide: BorderSide(color: Get.theme.focusColor.withOpacity(1)));
  _enabledBorder() => OutlineInputBorder(
      borderSide: BorderSide(color: Get.theme.focusColor.withOpacity(1)));
  _contentPadding() =>
      EdgeInsets.only(bottom: 12, top: 12, left: 16, right: 16);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => loginController.isLoading.value
          ? Container(
              width: Get.width * 0.7,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: loginController.isCode.value
                  ? _buildCodeField()
                  : _buildPhoneField(),
            ),
    );
  }

  Widget _buildCodeField() {
    final mask = MaskTextInputFormatter(
      mask: '######',
      filter: {"#": RegExp(r'[0-9]')},
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [
              mask,
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 18,
            onChanged: (value) async {
              if (value.length == 6) {
                loginController.codeReady.value = true;
              } else {
                loginController.codeReady.value = false;
              }
            },
            decoration: InputDecoration(
              counterText: '',
              focusColor: Get.theme.primaryColor,
              hintText: '- - - - - -',
              labelText: LocaleKeys.login_enter_sms_code.tr,
              labelStyle: Get.textTheme.subtitle1,
              // hintStyle: _hintStyle(),
              border: _border(),
              focusedBorder: _focusedBorder(),
              enabledBorder: _enabledBorder(),
              contentPadding: _contentPadding(),
            ),
          ),
        ),
        Column(
          children: [
            FlatButton(
              onPressed: () {
                loginController.sendAgain();
              },
              textColor: Get.theme.hintColor,
              child: Center(
                child: Text(LocaleKeys.login_skip.tr),
              ),
            ),
            DefaultButton.withProgress(
              isProgress: loginController.isLoading,
              text: LocaleKeys.login_enter_sms_code.tr,
              onTap: loginController.enterCode,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    final mask = MaskTextInputFormatter(
      mask: '+996 ### ###-###',
      filter: {"#": RegExp(r'[0-9]')},
    );
    final length = loginController.phoneTextEditController.text.length;
    loginController.phoneTextEditController.selection = TextSelection(
      baseOffset: length,
      extentOffset: length,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: TextFormField(
            controller: loginController.phoneTextEditController,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [mask],
            maxLength: 18,
            onChanged: (value) {
              // final phone = mask.getUnmaskedText();
              // controller.phone.value = '+996' + phone;
            },
            decoration: InputDecoration(
              counterText: '',
              labelStyle: Get.textTheme.subtitle1,
              // hintStyle: _hintStyle(),
              border: _border(),
              focusedBorder: _focusedBorder(),
              enabledBorder: _enabledBorder(),
              contentPadding: _contentPadding(),
              hintText: '+996 000 000 000',
              labelText: LocaleKeys.login_enter_phone_number.tr,
            ),
          ),
        ),
        SizedBox(height: 32),
        DefaultButton.withProgress(
          isProgress: loginController.isLoading,
          text: LocaleKeys.login_send_sms_code.tr,
          onTap: loginController.sendCode,
        ),
      ],
    );
  }
}
