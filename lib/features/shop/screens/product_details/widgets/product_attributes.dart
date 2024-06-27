import 'package:e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EProductAttributes extends StatelessWidget {
  const EProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        ERoundedContainer(
          backgroundColor: isDark ? EColors.darkerGrey : EColors.grey, //!!!
          child: Column(
            children: [
              /// Title, Price and Stock Status
              Row(
                children: [
                  const ESectionHeading(
                    title: 'Variation', //!!!
                    showActionButton: true,
                  ),
                  const SizedBox(width: ESizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const EProductTitleText(
                            title: 'Price : ', //!!!
                            smallSize: true,
                          ),

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
                          const EProductTitleText(
                            title: 'Stock', //!!!
                            smallSize: true,
                          ),
                          Text(
                            'In Stock', //!!!
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const EProductTitleText(
                title: 'This is the Description of the Product and it can go upto max 4 lines.', //!!!
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /// Attributes Color
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(
              title: 'Colors', //!!!
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8, //!!!
              children: [
                EChoiceChip(
                  text: 'Green', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'Blue', //!!!
                  selected: true, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'Yellow', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
              ],
            ),
          ],
        ),

        /// Attributes Size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(
              title: 'Size', //!!!
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8, //!!!
              children: [
                EChoiceChip(
                  text: 'EU 34', //!!!
                  selected: true, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'EU 36', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
                EChoiceChip(
                  text: 'EU 38', //!!!
                  selected: false, //!!!
                  onSelected: (value) {}, //?
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
