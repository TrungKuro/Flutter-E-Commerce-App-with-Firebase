import 'package:e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EProductAttributes extends StatelessWidget {
  const EProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Column(
      children: [
        /* ----------------------------------------------------------------- */
        /*              Selected Attribute Pricing & Description             */
        /* ----------------------------------------------------------------- */

        ERoundedContainer(
          backgroundColor: isDark ? EColors.darkDarker30Per : EColors.lightDarker30Per,
          padding: const EdgeInsets.all(ESizes.md),
          child: Column(
            children: [
              /// Price and Stock Status
              Row(
                children: [
                  /// Title
                  const ESectionHeading(
                    title: ETexts.variation,
                    showActionButton: false,
                  ),
                  const SizedBox(width: ESizes.spaceBtwItems),

                  /// Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Price
                      Row(
                        children: [
                          /// Title Price
                          const EProductTitleText(
                            title: '${ETexts.price} :',
                            smallSize: true,
                          ),
                          const SizedBox(width: ESizes.spaceBtwItems),

                          /// Actual Price
                          Text(
                            '\$25', //!!!
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: ESizes.spaceBtwItems),

                          /// Sale Price
                          const EProductPriceText(
                            price: '20', //!!!
                          ),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          /// Title Stock
                          const EProductTitleText(
                            title: '${ETexts.stock} :',
                            smallSize: true,
                          ),
                          const SizedBox(width: ESizes.spaceBtwItems),

                          /// Stock Status
                          Text(
                            ETexts.inStock,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Variation Description
              const EProductTitleText(
                title:
                    'This is the Description of the Product and it can go upto max 4 lines.\nWhat that mean?\nLike this?\nWhat if I have more than.', //!!!
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /* ----------------------------------------------------------------- */
        /*                          Attributes Color                         */
        /* ----------------------------------------------------------------- */

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(
              title: ETexts.attributesColor,
              showActionButton: false,
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
            Wrap(
              spacing: ENumberConstants.spacingBetweenChosenAttributes,
              children: [
                EChoiceChip(
                  text: 'Green', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'Blue', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'Yellow', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'Red', //!!!
                  selected: true, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'Black', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'Brown', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'White', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'Purple', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /* ----------------------------------------------------------------- */
        /*                          Attributes Size                          */
        /* ----------------------------------------------------------------- */

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(
              title: ETexts.attributesSize,
              showActionButton: false,
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
            Wrap(
              spacing: ENumberConstants.spacingBetweenChosenAttributes,
              children: [
                EChoiceChip(
                  text: 'EU 34', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'EU 36', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'EU 38', //!!!
                  selected: true, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'EU 40', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
              ],
            ),
          ],
        ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
