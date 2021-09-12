import 'package:get/get.dart';

class FavoritesController extends GetxController {

  final favorites = Set<int>().obs;

  void addFavorite(int id){
    favorites.add(id);
  }

  void removeFavorite(int id){
    favorites.remove(id);
  }

  void toggleFavorite(int id){
    favorites.contains(id) ? removeFavorite(id) : addFavorite(id);
    print(favorites.toList());
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
