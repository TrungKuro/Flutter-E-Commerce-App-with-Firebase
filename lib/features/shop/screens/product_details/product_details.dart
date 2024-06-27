import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_description.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const EBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            const EProductDetailImageSlider(),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: ESizes.defaultSpace,
                left: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share Button
                  const ERattingAndShare(),

                  /* ------------------------------------------------------- */

                  const Divider(),
                  const SizedBox(height: ESizes.spaceBtwSections / 2),

                  /// Price, Title, Stock, Brand
                  const EProductMetalData(),

                  const SizedBox(height: ESizes.spaceBtwSections / 2),

                  /// Attributes
                  const EProductAttributes(),

                  const SizedBox(height: ESizes.spaceBtwSections / 2),
                  const Divider(),

                  /* ------------------------------------------------------- */

                  const SizedBox(height: ESizes.spaceBtwSections / 2),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {}, //?
                      child: const Text(ETexts.checkOut),
                    ),
                  ),

                  const SizedBox(height: ESizes.spaceBtwSections / 2),

                  /// Description
                  const EProductDescription(),

                  const SizedBox(height: ESizes.spaceBtwSections / 2),

                  /* ----------------------------------------------------- */

                  const Divider(),

                  /* ----------------------------------------------------- */

                  /// Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ESectionHeading(
                        title: 'Reviews (199)', //!!!
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () {}, //?
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
