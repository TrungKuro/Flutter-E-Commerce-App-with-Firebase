import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
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
          Row(children: listBrandTopProductImageWidget(images, context)),
        ],
      ),
    );
  }
}

/* ------------------------------------------------------------------------- */

List<Widget> listBrandTopProductImageWidget(List<String> images, BuildContext context) {
  List<Widget> brands = [];

  for (int i = 0; i < images.length; i++) {
    brands.add(brandTopProductImageWidget(images[i], context));
    if (i < images.length - 1) brands.add(const SizedBox(width: ESizes.sm));
  }

  return brands;
}

/* ------------------------------------------------------------------------- */

Widget brandTopProductImageWidget(String image, BuildContext context) {
  final isDark = EHelperFunctions.isDarkMode(context); //!

  return Expanded(
    child: ERoundedContainer(
      height: ENumberConstants.heightTop3ProductsBrand,
      backgroundColor: isDark ? EColors.darkerGrey : EColors.grey,
      padding: const EdgeInsets.all(ESizes.xs),
      child: ClipRRect(
        //! Tạo hiệu ứng "Nested corner radii"
        borderRadius: BorderRadius.circular(ESizes.md - ESizes.xs),
        child: Container(
          color: EColors.darkGrey,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    ),
  );
}
