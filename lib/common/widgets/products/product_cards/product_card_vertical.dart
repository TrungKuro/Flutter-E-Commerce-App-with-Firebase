import 'package:e_commerce_app/common/styles/shadow_styles.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/products/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return GestureDetector(
      onTap: () {}, //!
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ESizes.cardRadiusLg),
          color: isDark ? EColors.darkerGrey : EColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist, Discount
            ERoundedContainer(
              radius: ESizes.cardRadiusLg - 1, //! Tạo hiệu ứng "Nested corner radii"
              height: 180,
              padding: const EdgeInsets.all(ESizes.sm),
              backgroundColor: isDark ? EColors.dark : EColors.light,
              child: Stack(
                children: [
                  /// Thumnail Image
                  const ERoundedImage(
                    borderRadius: ESizes.cardRadiusLg - 1 - ESizes.sm, //! Tạo hiệu ứng "Nested corner radii"
                    imageUrl: EImages.productShoesAdidas3,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  /// Discount & Wishlist
                  Positioned(
                    top: 1,
                    left: 1,
                    right: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Sale Tag
                        ERoundedContainer(
                          radius: ESizes.sm,
                          backgroundColor: EColors.secondary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
                          child:
                              Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black)),
                        ),

                        /// Favourite Icon Button
                        const ECircularIcon(
                          icon: Iconsax.heart5,
                          color: EColors.favourite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: ESizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name Product
                  const EProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),

                  /// Name Company
                  Row(
                    children: [
                      Text(
                        'Nike',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: ESizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: EColors.primary,
                        size: ESizes.iconXs,
                      ),
                    ],
                  ),

                  /// Price & Button buy
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      const EProductPriceText(
                        price: '35.0',
                        isLarge: true,
                      ),

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: EColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ESizes.cardRadiusMd),
                            bottomRight: Radius.circular(ESizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: ESizes.iconLg * 1.2,
                          height: ESizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: EColors.white)),
                        ),
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
