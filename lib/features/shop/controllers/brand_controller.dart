import 'package:e_commerce_app/data/repositories/brands/brand_repository.dart';
import 'package:e_commerce_app/data/repositories/product/product_repository.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find(); //!

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featureBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository()); //!

  @override
  void onInit() {
    super.onInit();
    getFeaturedBrands();
  }

  /// --- LOAD brands
  Future<void> getFeaturedBrands() async {
    try {
      // Show loader while loading Brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featureBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4)); //!!!
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      // Stop loader
      isLoading.value = false;
    }
  }

  /// --- GET brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }

  /// --- GET brand specific products from your data source
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }
}
