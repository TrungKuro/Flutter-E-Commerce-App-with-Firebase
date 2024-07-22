import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class EProductDescription extends StatelessWidget {
  const EProductDescription({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ESectionHeading(
          title: ETexts.description,
          showActionButton: false,
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        ReadMoreText(
          product.description ?? '',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ETexts.collapsedDescription,
          trimExpandedText: ETexts.expandedDescription,
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
