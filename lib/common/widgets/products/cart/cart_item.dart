import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:e_commerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,
    required this.showAddRemoveButtons,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* ----------------------------------------------------------------- */

        /// Image Product
        ERoundedContainer(
          height: ENumberConstants.heightProductInCart,
          backgroundColor: isDark ? EColors.darkerGrey : EColors.grey,
          padding: const EdgeInsets.all(ESizes.xs),
          child: ClipRRect(
            //! Tạo hiệu ứng "Nested corner radii"
            borderRadius: BorderRadius.circular(ESizes.md - ESizes.xs),
            child: Container(
              color: EColors.darkGrey,
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage(EImages.productToysBandai2), //!!!
              ),
            ),
          ),
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
              const EBrandTitleWithVerifiedIcon(title: 'Nike'), //!!!

              /// Name
              const EProductTitleText(title: 'Black Sports shoes', maxLines: 1), //!!!

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall), //!!!
                    TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge), //!!!
                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall), //!!!
                    TextSpan(text: 'UK 08 ', style: Theme.of(context).textTheme.bodyLarge), //!!!
                  ],
                ),
              ),

              /* ------------------------------------------------------------- */

              if (showAddRemoveButtons) const SizedBox(height: ESizes.spaceBtwItems),

              /* ------------------------------------------------------------- */

              /// Quantity & Total
              if (showAddRemoveButtons)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EProductQuantityWithAddRemoveButton(),
                    EProductPriceText(price: '256'), //!!!
                  ],
                ),

              /* ------------------------------------------------------------- */
            ],
          ),
        ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
