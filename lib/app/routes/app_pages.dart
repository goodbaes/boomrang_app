import 'package:get/get.dart';

import 'package:boomerang/app/modules/app-page/bindings/app_page_binding.dart';
import 'package:boomerang/app/modules/app-page/views/app_page_view.dart';
import 'package:boomerang/app/modules/auth/bindings/auth_binding.dart';
import 'package:boomerang/app/modules/auth/views/auth_view.dart';
import 'package:boomerang/app/modules/home/bindings/home_binding.dart';
import 'package:boomerang/app/modules/home/views/home_view.dart';
import 'package:boomerang/app/modules/login/bindings/login_binding.dart';
import 'package:boomerang/app/modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.APP_PAGE,
      page: () => AppPageView(),
      binding: AppPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
