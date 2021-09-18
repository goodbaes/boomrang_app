// import 'dart:io';

import 'package:boomerang/app/modules/app-page/views/app_page_view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

import 'service_locator/init_modules.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initModules();
  runApp(AppPageView());
}
