import 'package:boomerang/common/custiom_widgets/custom_profile_textfield.dart';
import 'package:boomerang/common/custiom_widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мой профиль'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                CustomTextFieldProfile(
                  textController: controller.nameController,
                  labelText: 'Имя',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFieldProfile(
                  textController: controller.secNameController,
                  labelText: 'Фамилия',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFieldProfile(
                  textController: controller.numberController,
                  labelText: 'Телефон',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFieldProfile(
                  textController: controller.emailController,
                  labelText: 'Email',
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Push уведомления'),
                    Switch(value: true, onChanged: (v) async {})
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DefaultButton(
                    text: 'Сохранить',
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
