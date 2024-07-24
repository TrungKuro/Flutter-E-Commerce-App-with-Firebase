import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EBrandShowcase extends StatelessWidget {
  const EBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)), //?
      child: ERoundedContainer(
        showBorder: true,
        borderColor: EColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(ESizes.md),
        margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Products Count
            EBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: ESizes.spaceBtwItems),

            /// Brand Top 3 Product Images
            Row(children: listBrandTopProductImageWidget(images, context)),
          ],
        ),
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
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) => const EShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    ),
  );
}
