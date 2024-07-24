import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/screens/all_products.dart/all_products.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/category_brands.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Top Brands
              CategoryBrands(category: category),
              const SizedBox(height: ESizes.spaceBtwItems),

              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  // Handle loader , no record, or error message
                  final response = ECloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const EVerticalProductShimmer(),
                  );
                  if (response != null) return response;

                  // record found!
                  final products = snapshot.data!;

                  return Column(
                    children: [
                      /// Title "You Might Like"
                      ESectionHeading(
                        title: ETexts.mightLikeTitle,
                        onPressed: () => Get.to(
                          () => AllProductsScreen(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                          ),
                        ), //?
                      ),

                      const SizedBox(height: ESizes.spaceBtwItems),

                      /// List "You Might Like"
                      EGridLayout(
                        itemCount: products.length, // ENumberConstants.youMightLikeNumber
                        itemBuilder: (_, index) => EProductCardVertical(product: products[index]),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
