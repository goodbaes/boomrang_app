import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:boomerang/common/navigation/src/app_routes.dart';
import 'package:boomerang/domain/domain.dart';

class AppPageController extends GetxController {
  final AppSettingsRepository _appSettingsRepo;
  final AuthRepository _authRepo;
  StreamSubscription<String>? _tokenStream;

  AppPageController(
    this._appSettingsRepo,
    this._authRepo,
  );

  late final themeMode = _appSettingsRepo.getThemeModeRx();
  final appState = AppLifecycleState.resumed.obs;

  @override
  void onReady() {
    super.onReady();

    _authRepo.getTokenRx().listen((token) {
      if (token.isEmpty) {
        // TODO: Create Login Page
        // AppRoutes.login.pushAndRemoveUntilAll();
      }
    });
  }

  @override
  void onClose() {
    _tokenStream?.cancel();
    _tokenStream = null;
    super.onClose();
  }
}
