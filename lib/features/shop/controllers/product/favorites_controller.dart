import 'dart:convert';

import 'package:e_commerce_app/data/repositories/product/product_repository.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/local_storage/storage_utility.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  static FavoritesController get instance => Get.find();

  /// Variable
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method to initialize favourites by reading from storage
  Future<void> initFavourites() async {
    final json = ELocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  //!!!
  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  //!!!
  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      ELoaders.customToast(message: 'Product has been added to the Wishlist.');
    } else {
      ELocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      ELoaders.customToast(message: 'Product has been removed from the Wishlist.');
    }
  }

  //!!!
  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    ELocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  //!!!
  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
  }
}
