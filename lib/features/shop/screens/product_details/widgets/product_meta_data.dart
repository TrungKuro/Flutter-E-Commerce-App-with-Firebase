import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EProductMetalData extends StatelessWidget {
  const EProductMetalData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale
        Row(
          children: [
            /// Sale Tag
            ERoundedContainer(
              radius: ESizes.sm,
              backgroundColor: EColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
              child: Text(
                '25%', //!!!
                style: Theme.of(context).textTheme.labelLarge!.apply(color: EColors.black),
              ),
            ),
            const SizedBox(width: ESizes.spaceBtwItems),

            /// Price Old
            Text(
              '\$250', //!!!
              style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: ESizes.spaceBtwItems),

            /// Price New
            const EProductPriceText(
              price: '175', //!!!
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 1.5),

        /// Title
        const EProductTitleText(
          title: 'Green Nike Sports Shirt', //!!!
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const EProductTitleText(
              title: '${ETexts.status} :',
            ),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text(
              ETexts.outStock, //!!!
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            ECircularImage(
              image: EImages.shoesIcon, //!!!
              backgroundColor: Colors.transparent,
              width: 37,
              height: 37,
              overlayColor: isDark ? EColors.white : EColors.black,
              padding: const EdgeInsets.all(ESizes.sm),
              isClip: false,
            ),
            const EBrandTitleWithVerifiedIcon(
              title: 'Nike', //!!!
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
