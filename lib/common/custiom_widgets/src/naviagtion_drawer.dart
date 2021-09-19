import 'package:boomerang/app/modules/login/controllers/login_controller.dart';
import 'package:boomerang/app/routes/app_pages.dart';
import 'package:boomerang/common/theme/app_colors.dart';
import 'package:boomerang/utils/assets/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';


class NavigationDrawer extends StatelessWidget{

  final padding = EdgeInsets.symmetric(horizontal: 20.0);
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 48),
            _buildLogo(),
            _buildMenuItems(),
          ],
        )
      ),
    );
  }

  Widget _buildLogo(){
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImage('assets/images/boomerang-dark.svg').svg(width: 200),
          ],
        ),
        const SizedBox(height: 18),
        Divider(color: Colors.black38,),
      ],
    );
  }

  Widget _buildMenuItems(){
    return Expanded(
      child: ListView(
        padding: padding,
        children: <Widget>[
          _menuItem(
            text: 'Главная',
            icon: Icons.home_outlined,
            onClick: (){
              Get.toNamed(Routes.HOME);
            },
          ),
          _menuItem(
            text: 'Мой профиль',
            icon: Icons.person_outline,
            onClick: (){},
          ),
          _menuItem(
            text: 'История заказов',
            icon: Icons.shopping_cart_outlined,
            onClick: (){},
          ),
          _menuItem(
            text: 'Мои адреса',
            icon: Icons.map_outlined,
            onClick: (){},
          ),
          _menuItem(
            text: 'Помощь',
            icon: Icons.question_answer_outlined,
            onClick: (){},
          ),
          _menuItem(
            text: 'Настройки',
            icon: Icons.settings_outlined,
            onClick: (){},
          ),
          _menuItem(
            text: 'Выйти из аккаунта',
            icon: Icons.logout_outlined,
            onClick: (){
              loginController.logout();
            },
            color: AppColors.red,
          ),
        ],
      )
    );
  }

  Widget _menuItem({
    required String text,
    required VoidCallback onClick,
    IconData? icon,
    Color? color,
  }){
    // final color = Colors.white;
    final hoverColor = AppColors.lightGreen;
    return ListTile(
      leading: icon != null ? Icon(icon, color: color) : null,
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClick,
    );
  }
}