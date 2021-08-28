import 'package:get/get.dart';
import 'package:boomerang/common/localization/app_localization.dart';
import 'package:boomerang/domain/domain.dart';
import '../../constants.dart';
import 'list_extensions.dart';

extension ExtensionsGetxController on GetxController {
  void showServerError(ServerError error) {
    final entries = error.errors.entries;
    if (entries.isNotEmpty) {
      final titleError = entries.first.key;
      final messageError = entries.first.value.firstOrNull();
      Get.showSnackbar(GetBar(
        title: titleError,
        message: messageError,
        duration: kDurationErrorSnackBar,
      ));
    }
  }

  void handleUnknownError(dynamic error) {
    Get.showSnackbar(GetBar(
      message: ALKeys.unknownError.tr,
      duration: kDurationErrorSnackBar,
    ));
  }

  void handleErrorForKeys(
    ServerError serverError,
    Map<String, Function(String)> keyHandleMap, {
    bool showErrorIfKeysNotFound = true,
  }) {
    var anyKeyFound = false;
    keyHandleMap.forEach((key, value) {
      final error = serverError.errors[key].firstOrNull();
      if (error == null) return;
      anyKeyFound = true;
      value.call(error);
    });
    if (!anyKeyFound) {
      showServerError(serverError);
    }
  }
}
