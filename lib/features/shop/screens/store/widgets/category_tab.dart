import 'package:e_commerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category; //!!!!!

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Brand first (Top 3 products)
              const EBrandShowcase(
                images: [
                  EImages.productToysLego1,
                  EImages.productToysLego3,
                  EImages.productToysLego5,
                ],
              ), //!!!

              /// Brand second (Top 3 products)
              const EBrandShowcase(
                images: [
                  EImages.productShoesPuma1,
                  EImages.productShoesPuma3,
                  EImages.productShoesPuma5,
                ],
              ), //!!!

              /// Brand third (Top 3 products)
              const EBrandShowcase(
                images: [
                  EImages.productToysKotobukiya5,
                  EImages.productToysKotobukiya3,
                  EImages.productToysKotobukiya1,
                ],
              ), //!!!

              /// Spacing
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Title "You Might Like"
              ESectionHeading(
                title: ETexts.mightLikeTitle,
                onPressed: () {}, //?
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// List "You Might Like"
              EGridLayout(
                itemCount: ENumberConstants.youMightLikeNumber,
                itemBuilder: (_, index) => EProductCardVertical(product: ProductModel.empty()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
