import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/screens/all_products.dart/all_products.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController()); //!

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Column(
          children: [
            /* ------------------------------------------------------------- */
            /*                             HEADER                            */
            /* ------------------------------------------------------------- */

            const EPrimaryHeaderContainer(
              child: Column(
                children: [
                  /* ------------------------------------------------------- */

                  /// AppBar - Name Customer & Number of products in the shopping cart
                  EHomeAppBar(),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /// SearchBar
                  ESearchContainer(text: ETexts.searchBarTitle, showBorder: false),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /// Popular Categories
                  Column(
                    children: [
                      /// Title "Popular Categories"
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: ESizes.defaultSpace),
                        child: ESectionHeading(
                          title: ETexts.popularCategoriesTitle,
                          textColor: EColors.white,
                          showActionButton: false,
                        ),
                      ),
                      SizedBox(height: ESizes.spaceBtwItems),

                      /// List "Categories Product"
                      EHomeCategories(),
                    ],
                  ),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /* ------------------------------------------------------- */
                ],
              ),
            ),

            /* ------------------------------------------------------------- */
            /*                              BODY                             */
            /* ------------------------------------------------------------- */

            Padding(
              padding: const EdgeInsets.only(
                top: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /* ----------------- Promo Banner Slider ----------------- */

                  const EPromoSlider(),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /* ------------------- Popular Products ------------------ */

                  Padding(
                    padding: const EdgeInsets.only(
                      left: ESizes.defaultSpace,
                      right: ESizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        /// Title "Popular Products"
                        ESectionHeading(
                          title: ETexts.popularProductsTitle,
                          onPressed: () => Get.to(
                            () => AllProductsScreen(
                              //query: FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6), //!!!
                              title: ETexts.popularProductsTitle,
                              futureMethod: controller.fetchAllFeaturedProducts(),
                            ),
                          ), //?
                        ),
                        const SizedBox(height: ESizes.spaceBtwItems),

                        /// List "Popular Products"
                        Obx(() {
                          if (controller.isLoading.value) return const EVerticalProductShimmer();
                          if (controller.featuredProducts.isEmpty) {
                            return Center(
                                child: Text(
                              'No data found!',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )); //!!!
                          }
                          return EGridLayout(
                            itemCount: controller.featuredProducts.length, //!!!
                            itemBuilder: (_, index) => EProductCardVertical(product: controller.featuredProducts[index]),
                          );
                        }),
                      ],
                    ),
                  ),

                  /* ------------------------------------------------------- */
                ],
              ),
            ),
          ],
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
