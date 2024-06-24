import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EBrandShowcase extends StatelessWidget {
  const EBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      showBorder: true,
      borderColor: EColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ESizes.md),
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const EBrandCard(showBorder: false),
          const SizedBox(height: ESizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList()),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  final isDark = EHelperFunctions.isDarkMode(context); //!

  return Expanded(
    child: ERoundedContainer(
      height: 100, //!!!
      backgroundColor: isDark ? EColors.darkerGrey : EColors.light,
      margin: const EdgeInsets.only(right: ESizes.sm),
      padding: const EdgeInsets.all(ESizes.md),
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ), //!!!
    ),
  );
}
