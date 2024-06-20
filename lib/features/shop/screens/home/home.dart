import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            EPrimaryHeaderContainer(
              height: 430, //!
              child: Column(
                children: [
                  /// AppBar
                  const EHomeAppBar(),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /// SearchBar
                  ESearchContainer(
                    text: ETexts.searchBarTitle,
                    onTap: () {
                      // ignore: avoid_print
                      print('search');
                    }, //!
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /// Categories
                  const Padding(
                    padding: EdgeInsets.only(left: ESizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        ESectionHeading(
                          title: ETexts.categoriesTitle,
                          textColor: EColors.white,
                          showActionButton: false,
                        ),
                        SizedBox(height: ESizes.spaceBtwSections),

                        /// Categories
                        EHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Body
            const Padding(
              padding: EdgeInsets.all(ESizes.defaultSpace),
              child: EPromoSlider(
                banners: [
                  EImages.promoBanner1,
                  EImages.promoBanner2,
                  EImages.promoBanner3,
                  EImages.promoBanner4,
                  EImages.promoBanner5,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
