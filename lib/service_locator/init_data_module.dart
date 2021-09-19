part of 'init_modules.dart';

const _appPrefKeyStorage = 'app_pref';

Future _initDataModule() async {
  final appStorage = GetStorage(_appPrefKeyStorage);
  await appStorage.initStorage;
  Get.put(AppPreference(appStorage));
  await _initRemote();
  await _initMappers();
  await _initRepositories();
  if (kDebugMode) {
    await _initTestRepositories();
  }
}

Future _initRemote() async {
  final dio = DioClient.client;
  dio.interceptors..add(AuthInterceptor(Get.find(), dio));
  Get
    ..put(dio)
    ..put(UserApiClient(Get.find()))
    ..put(FilesApiClient(Get.find()));
}

Future _initMappers() async {
  Get
    ..put(ImageMapper())
    ..put(UserMapper(Get.find()))
    ..put(PageMapper());
}

Future _initRepositories() async {
  Get
    ..put<AppSettingsRepository>(
      AppSettingsRepositoryImpl(Get.find()),
    )
    ..put<AuthRepository>(
      AuthRepositoryImpl(
        Get.find(),
        Get.find(),
      ),
    )
    ..put<UserRepository>(
      UserRepositoryImpl(
        Get.find(),
        Get.find(),
      ),
    )
    ..put<FileRepository>(
      FileRepositoryImpl(Get.find()),
    );
}

Future _initTestRepositories() async {}
