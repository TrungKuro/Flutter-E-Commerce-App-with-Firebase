import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                  const EPromoSlider(
                    banners: [
                      EImages.promoBanner1,
                      EImages.promoBanner2,
                      EImages.promoBanner3,
                      EImages.promoBanner4,
                      EImages.promoBanner5,
                    ], //!!!
                  ),
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
                          onPressed: () {}, //?
                        ),
                        const SizedBox(height: ESizes.spaceBtwItems),

                        /// List "Popular Products"
                        EGridLayout(
                          itemCount: ENumberConstants.popularProductNumber,
                          itemBuilder: (_, index) => const EProductCardVertical(),
                        ),
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
