import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EProductDetailImageSlider extends StatelessWidget {
  const EProductDetailImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return ECurvedEdgeWidget(
      child: Container(
        color: isDark ? EColors.darkerGrey : EColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400, //!!!
              child: Padding(
                padding: EdgeInsets.all(ESizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(EImages.productShoesAdidas3), //!!!
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: ESizes.defaultSpace,
              child: SizedBox(
                height: 80, //!!!
                child: ListView.separated(
                  itemCount: 4, //!!!
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: ESizes.spaceBtwItems),
                  itemBuilder: (_, index) => ERoundedImage(
                    width: 80, //!!!
                    backgroundColor: isDark ? EColors.dark : EColors.white,
                    border: Border.all(color: EColors.primary),
                    padding: const EdgeInsets.all(ESizes.sm),
                    imageUrl: EImages.productShoesAdidas3, //!!!
                  ),
                ),
              ),
            ),

            /// AppBar Icons
            const EAppBar(
              showBackArrow: true,
              actions: [ECircularIcon(icon: Iconsax.heart5, color: EColors.favourite)],
            ),
          ],
        ),
      ),
    );
  }
}
