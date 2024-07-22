import 'package:e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EProductAttributes extends StatelessWidget {
  const EProductAttributes({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController()); //!
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Obx(
      () => Column(
        children: [
          /* ----------------------------------------------------------------- */
          /*              Selected Attribute Pricing & Description             */
          /* ----------------------------------------------------------------- */

          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
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
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: ESizes.spaceBtwItems),

                              /// Sale Price
                              EProductPriceText(price: controller.getVariationPrice()),
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
                                controller.variationStockStatus.value,
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
                  EProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(height: ESizes.spaceBtwItems),

          /* ----------------------------------------------------------------- */
          /*                             Attributes                            */
          /* ----------------------------------------------------------------- */

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ESectionHeading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: ENumberConstants.spacingBetweenChosenAttributes,
                          children: attribute.values!.map(
                            (attributeValue) {
                              final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                              final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);
                              return EChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                                        }
                                      }
                                    : null, //?
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),

          // const SizedBox(height: ESizes.spaceBtwItems),

          /* ----------------------------------------------------------------- */
        ],
      ),
    );
  }
}
