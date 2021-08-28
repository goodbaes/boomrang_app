import 'package:flutter/material.dart' show RoutePredicate;
import 'package:get/get.dart';

enum AppRoutes {
  init,
  home,
}

extension GetNavigation on AppRoutes {
  Future? push({dynamic arguments}) => Get.toNamed(
        asPath(),
        arguments: arguments,
      );

  Future? pushReplacement({dynamic arguments}) => Get.offNamed(
        asPath(),
        arguments: arguments,
      );

  Future? pushAndRemoveUntil(RoutePredicate predicate, {dynamic arguments}) =>
      Get.offNamedUntil(
        asPath(),
        predicate,
        arguments: arguments,
      );

  Future? pushAndRemoveUntilAll({dynamic arguments}) => Get.offAllNamed(
        asPath(),
        arguments: arguments,
      );
}

extension EnumToString on AppRoutes {
  String asPath() {
    String path = '/';
    if (this != AppRoutes.init) {
      path += AppRoutes.values[this.index].toString().split('.').last;
    }
    return path;
  }
}
