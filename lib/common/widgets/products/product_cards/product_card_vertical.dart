import 'package:e_commerce_app/common/styles/shadow_styles.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance; //!!!
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice); //!!!
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)), //?
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
            /* ------------------------------------------------------------- */

            /// Thumbnail, Wishlist, Discount
            ERoundedContainer(
              //! Tạo hiệu ứng "Nested corner radii"
              radius: ESizes.cardRadiusLg - 1,
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(ESizes.sm),
              backgroundColor: isDark ? EColors.dark : EColors.light,
              child: Stack(
                children: [
                  /// Thumnail Image
                  Center(
                    child: ERoundedImage(
                      //! Tạo hiệu ứng "Nested corner radii"
                      borderRadius: ESizes.cardRadiusLg - 1 - ESizes.sm,
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
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
                        if (salePercentage != null)
                          ERoundedContainer(
                            radius: ESizes.sm,
                            backgroundColor: EColors.secondary.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
                            child: Text(
                              '$salePercentage%',
                              style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black),
                            ),
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

            /* ------------------------------------------------------------- */

            /// Details
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: ESizes.sm,
                  right: ESizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name Product
                    EProductTitleText(
                      title: product.title,
                      smallSize: true,
                    ),
                    const SizedBox(height: ESizes.spaceBtwItems / 2),

                    /// Name Brand
                    EBrandTitleWithVerifiedIcon(
                      title: product.brand!.name,
                    ),
                  ],
                ),
              ),
            ),

            /* ------------------------------------------------------------- */

            //! Đảm bảo giữ khoảng cách đều trên dưới dù tên sản phẩm là 1 hay 2 dòng
            const Spacer(),

            /* ------------------------------------------------------------- */

            /// Price & Button buy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: ESizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: ESizes.sm),
                        child: EProductPriceText(
                          price: controller.getProductPrice(product),
                          isLarge: true,
                        ),
                      ),
                    ],
                  ),
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

            /* ------------------------------------------------------------- */
          ],
        ),
      ),
    );
  }
}
