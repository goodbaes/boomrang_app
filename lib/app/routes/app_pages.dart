import 'package:get/get.dart';

import 'package:boomerang/app/modules/app-page/bindings/app_page_binding.dart';
import 'package:boomerang/app/modules/app-page/views/app_page_view.dart';
import 'package:boomerang/app/modules/cafe-detail/bindings/cafe_detail_binding.dart';
import 'package:boomerang/app/modules/cafe-detail/views/cafe_detail_view.dart';
import 'package:boomerang/app/modules/favorites/bindings/favorites_binding.dart';
import 'package:boomerang/app/modules/favorites/views/favorites_view.dart';
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
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CAFE_DETAIL,
      page: () => CafeDetailView(),
      binding: CafeDetailBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
    ),
  ];
}
