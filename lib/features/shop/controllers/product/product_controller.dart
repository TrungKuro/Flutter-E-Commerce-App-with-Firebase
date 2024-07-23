import 'package:e_commerce_app/data/repositories/product/product_repository.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProducts();
  }

  /// !!!
  void fetchFeaturedProducts() async {
    try {
      // show loader while loading products
      isLoading.value = true;

      // Fetch products
      final products = await productRepository.getFeaturedProducts();

      // Assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh sanp'); //!!!
    } finally {
      isLoading.value = false;
    }
  }

  /// !!!
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch products
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh sanp'); //!!!
      return [];
    }
  }

  /// Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      // Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale proce if available, otherwise regular proce)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  /// --- CALCULATE discount percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// --- CHECK product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'Instock' : 'Out of Stock'; //!!!
  }
}
