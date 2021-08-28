import 'package:boomerang/presentation/home/home_binding.dart';
import 'package:boomerang/presentation/home/home_page.dart';
import 'package:get/get.dart';

import 'package:boomerang/presentation/splash/splash_page.dart';
import 'package:boomerang/common/navigation/navigation.dart';

class AppPages {
  AppPages._();

  static GetPage get initPage => GetPage(
        name: AppRoutes.init.asPath(),
        page: () => SplashPage(),
        binding: SplashBindings(),
      );

  static List<GetPage> get pages => [
        initPage,
        // GetPage(
        //   name: AppRoutes.login.asPath(),
        //   page: () => LoginPage(),
        //   binding: LoginBindings(),
        // ),
        // GetPage(
        //   name: AppRoutes.loginInputCode.asPath(),
        //   page: () => LoginInputCodePage(),
        //   binding: LoginInputCodeBindings(),
        // ),
        GetPage(
          name: AppRoutes.home.asPath(),
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
      ];
}
