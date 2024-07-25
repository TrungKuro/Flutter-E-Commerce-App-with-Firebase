import 'package:e_commerce_app/data/repositories/categories/category_repository.dart';
import 'package:e_commerce_app/data/repositories/product/product_repository.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  final _categoryRepository = Get.put(CategoryRepository()); //!

  //! Observable
  final isLoading = false.obs;

  //! Observable
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  //! Observable
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  /* ----------------------------------------------------------------------- */
  /*                                 OVERRIDE                                */
  /* ----------------------------------------------------------------------- */

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// --- LOAD category data
  Future<void> fetchCategories() async {
    try {
      /* ------------------------------------------------------------------- */

      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories
          .assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(ENumberConstants.categoriesProductNumber).toList());

      /* ------------------------------------------------------------------- */
    } catch (e) {
      ELoaders.errorSnackBar(
        title: ETexts.ohSnapTitle,
        message: e.toString(),
      );
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  /// --- LOAD selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      ELoaders.errorSnackBar(
        title: ETexts.ohSnapTitle,
        message: e.toString(),
      );
      return [];
    }
  }

  /// --- GET "Category" or "Sub-Category" products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    // Fetch limited (4) products against each subCategory;
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }

  /* ----------------------------------------------------------------------- */
}
