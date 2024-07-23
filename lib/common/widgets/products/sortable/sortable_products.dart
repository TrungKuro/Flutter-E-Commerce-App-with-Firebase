import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/controllers/all_products_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController()); //!

    controller.assignProducts(products);

    List<String> productFilter = [
      'Name',
      'Higher Price',
      'Lower Price',
      'Sale',
      'Newest',
      'Popularity',
    ]; //!

    return Column(
      children: [
        /* ----------------------------------------------------------------- */

        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          }, //?
          items: productFilter.map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
        ),
        const SizedBox(height: ESizes.spaceBtwSections),

        /// Products
        Obx(
          () => EGridLayout(
            itemCount: controller.products.length, // ENumberConstants.popularProductNumber
            itemBuilder: (_, index) => EProductCardVertical(product: controller.products[index]),
          ),
        ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
