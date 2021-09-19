part of 'init_modules.dart';

Future _initPresentationModule() async {
  Get
    ..lazyPut(
      () => AppPageController(),
    )
    ..lazyPut(
      () => LoginController(),
    )
    ..lazyPut(
      () => FavoritesController(),
    );
}
