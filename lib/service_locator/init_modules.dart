import 'package:boomerang/app/modules/app-page/controllers/app_page_controller.dart';
import 'package:boomerang/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:boomerang/data/data.dart';
import 'package:boomerang/domain/domain.dart';
// import 'package:boomerang/presentation/chats/chats_controller.dart';
// import 'package:boomerang/presentation/profile/profile_controller.dart';
// import 'package:boomerang/presentation/search_people/search_people_controller.dart';
// import 'package:boomerang/test_data/src/repositories/repositories.dart';
import 'package:boomerang/utils/constants.dart';

part 'init_data_module.dart';

part 'init_presentation_module.dart';

Future initModules() async {
  await _initDataModule();
  await _initPresentationModule();
}
