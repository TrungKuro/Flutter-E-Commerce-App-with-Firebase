import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/features/shop/models/cart_item_model.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,
    required this.showAddRemoveButtons,
    required this.cartItem,
  });

  final bool showAddRemoveButtons;
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* ----------------------------------------------------------------- */

        /// Image Product
        // ERoundedContainer(
        //   height: ENumberConstants.heightProductInCart,
        //   backgroundColor: isDark ? EColors.darkerGrey : EColors.grey,
        //   padding: const EdgeInsets.all(ESizes.xs),
        //   child: ClipRRect(
        //     //! Tạo hiệu ứng "Nested corner radii"
        //     borderRadius: BorderRadius.circular(ESizes.md - ESizes.xs),
        //     child: Container(
        //       color: EColors.darkGrey,
        //       child: const Image(
        //         fit: BoxFit.cover,
        //         image: AssetImage(EImages.productToysBandai2), //!!!
        //       ),
        //     ),
        //   ),
        // ),
        ERoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ESizes.sm),
          backgroundColor: isDark ? EColors.darkerGrey : EColors.light,
        ),

        /* ----------------------------------------------------------------- */

        const SizedBox(width: ESizes.spaceBtwItems),

        /* ----------------------------------------------------------------- */

        /// Info product & Quantity purchased & Total price buy
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* ------------------------------------------------------------- */

              /// Brand
              EBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),

              /// Name
              EProductTitleText(title: cartItem.title, maxLines: 1),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(children: [
                          TextSpan(text: ' ${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                        ]),
                      )
                      .toList(),
                ),
              ),

              /* ------------------------------------------------------------- */

              if (showAddRemoveButtons) const SizedBox(height: ESizes.spaceBtwItems),

              /* ------------------------------------------------------------- */

              /// Quantity & Total
              // if (showAddRemoveButtons)
              //   const Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       EProductQuantityWithAddRemoveButton(),
              //       EProductPriceText(price: '256'), //!!!
              //     ],
              //   ),

              /* ------------------------------------------------------------- */
            ],
          ),
        ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
