// import 'dart:io';

import 'package:boomerang/presentation/app/app_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';


import 'service_locator/init_modules.dart';

void main() async {
  // if (kDebugMode) {
  //   //from Charles
  //   HttpOverrides.global = CharlesProxy();
  // }
  WidgetsFlutterBinding.ensureInitialized();
  await initModules();
  runApp(
    AppPage()
  );
}