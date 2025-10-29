import 'package:e_commerce_app/data/dummy_data.dart';
import 'package:e_commerce_app/data/repositories/banners/banner_repository.dart';
import 'package:e_commerce_app/data/repositories/brands/brand_repository.dart';
import 'package:e_commerce_app/data/repositories/categories/category_repository.dart';
import 'package:e_commerce_app/data/repositories/product/product_repository.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UploadDataController extends GetxController {
  static UploadDataController get instance => Get.find();

  /* ----------------------------------------------------------------------- */
  /*                                VARIABLES                                */
  /* ----------------------------------------------------------------------- */

  final isUploading = false.obs;

  /* ----------------------------------------------------------------------- */
  /*                                FUNCTIONS                                */
  /* ----------------------------------------------------------------------- */

  /// Upload all dummy data to Firebase
  Future<void> uploadAllData() async {
    try {
      // Set uploading state
      isUploading.value = true;

      // Show loading
      EFullScreenLoader.openLoadingDialog(
        'Uploading data to Cloud Firebase...',
        'assets/images/animations/Lottie Loading.json',
      );

      // Upload in sequence to avoid overwhelming Firebase
      await uploadCategories();
      await uploadBrands();
      await uploadBrandCategories();
      await uploadProducts();
      await uploadProductCategories();
      await uploadBanners();

      // Show success message
      ELoaders.successSnackBar(
        title: 'Success!',
        message: 'All data has been uploaded to Cloud Firebase successfully!',
      );
    } catch (e) {
      // Show error message
      ELoaders.errorSnackBar(
        title: 'Upload Failed',
        message: e.toString(),
      );
    } finally {
      // Always reset state and remove loader
      EFullScreenLoader.stopLoading();
      isUploading.value = false;
    }
  }

  /// Upload Categories
  Future<void> uploadCategories() async {
    try {
      final categoryRepository = Get.put(CategoryRepository());
      await categoryRepository.uploadDummyData(EDummyData.categories);
    } catch (e) {
      throw 'Failed to upload Categories: ${e.toString()}';
    }
  }

  /// Upload Brands
  Future<void> uploadBrands() async {
    try {
      final brandRepository = Get.put(BrandRepository());
      await brandRepository.uploadDummyData(EDummyData.brands);
    } catch (e) {
      throw 'Failed to upload Brands: ${e.toString()}';
    }
  }

  /// Upload Brand Categories
  Future<void> uploadBrandCategories() async {
    try {
      final brandRepository = Get.put(BrandRepository());
      await brandRepository.uploadBrandCategory(EDummyData.brandCategories);
    } catch (e) {
      throw 'Failed to upload BrandCategories: ${e.toString()}';
    }
  }

  /// Upload Products
  Future<void> uploadProducts() async {
    try {
      final productRepository = Get.put(ProductRepository());
      await productRepository.uploadDummyData(EDummyData.products);
    } catch (e) {
      throw 'Failed to upload Products: ${e.toString()}';
    }
  }

  /// Upload Product Categories
  Future<void> uploadProductCategories() async {
    try {
      final productRepository = Get.put(ProductRepository());
      await productRepository.uploadProductCategory(EDummyData.productCategories);
    } catch (e) {
      throw 'Failed to upload ProductCategories: ${e.toString()}';
    }
  }

  /// Upload Banners
  Future<void> uploadBanners() async {
    try {
      final bannerRepository = Get.put(BannerRepository());
      await bannerRepository.uploadDummyData(EDummyData.banners);
    } catch (e) {
      throw 'Failed to upload Banners: ${e.toString()}';
    }
  }

  /* ----------------------------------------------------------------------- */
}
