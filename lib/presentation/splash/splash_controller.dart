import 'package:get/get.dart';
import 'package:boomerang/common/navigation/navigation.dart';
import 'package:boomerang/domain/domain.dart';
import 'package:boomerang/utils/extensions/extensions.dart';

class SplashController extends GetxController {
  final AuthRepository _authRepo;
  final UserRepository _userRepo;

  SplashController(
    this._authRepo,
    this._userRepo,
  );

  @override
  void onReady() {
    super.onReady();
    AppRoutes.home.pushReplacement();
    if (_authRepo.getToken().isNotEmpty) {
      _checkUserRegFormEnd();
    } else {
      // TODO: Create Login Page
      // AppRoutes.login.pushReplacement();
    }
  }

  void _checkUserRegFormEnd() {
    _userRepo.getUser().then((value) {
      AppRoutes.home.pushReplacement();
      // TODO: Create Register Page
      // if (value is UserModelNotEndRegForm) {
      //   // AppRoutes.registrationForm.pushReplacement();
      // } else {
      //   AppRoutes.home.pushReplacement();
      // }
    }).catchError((e) {
      // AppRoutes.login.pushReplacement();
    }).catchServerError(showServerError);
  }
}
