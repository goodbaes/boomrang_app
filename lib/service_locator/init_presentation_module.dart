part of 'init_modules.dart';

Future _initPresentationModule() async {
  Get
    ..lazyPut(
      () => AppPageController(),
    );
  Get
    ..lazyPut(
      () => FavoritesController(),
    );
}
