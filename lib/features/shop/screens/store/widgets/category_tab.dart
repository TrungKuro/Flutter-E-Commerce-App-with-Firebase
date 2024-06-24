import 'package:e_commerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({super.key});

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
              /// Brands
              const EBrandShowcase(
                images: [
                  EImages.productShoesPuma1,
                  EImages.productShoesPuma3,
                  EImages.productShoesPuma5,
                ],
              ), //!!!
              const EBrandShowcase(
                images: [
                  EImages.productToysKotobukiya5,
                  EImages.productToysKotobukiya3,
                  EImages.productToysKotobukiya1,
                ],
              ), //!!!
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Products
              ESectionHeading(
                title: 'You might like', //!!!
                onPressed: () {}, //!
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              EGridLayout(
                itemCount: 4, //!!!
                itemBuilder: (_, index) => const EProductCardVertical(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
