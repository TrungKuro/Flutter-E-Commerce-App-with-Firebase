import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class EProductDetailImageSlider extends StatelessWidget {
  const EProductDetailImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return ECurvedEdgeWidget(
      child: Container(
        color: isDark ? EColors.darkDarker30Per : EColors.lightDarker30Per,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: ENumberConstants.heightLargeImageProduct,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(EImages.productShoesAdidas5), //!!!
              ),
            ),

            /// Image Slider
            Positioned(
              left: 0,
              right: 0,
              bottom: ESizes.spaceBtwSections,
              child: SizedBox(
                height: ENumberConstants.heightImageProduct,
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: ESizes.defaultSpace,
                    right: ESizes.defaultSpace,
                  ),
                  itemCount: ENumberConstants.productImageNumber,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  //? Dấu (__) nghĩa là gì, nó khác gì với dấu (_)
                  separatorBuilder: (_, __) => const SizedBox(width: ESizes.spaceBtwItems),
                  itemBuilder: (_, index) => ERoundedImage(
                    width: ENumberConstants.widthImageProduct,
                    fit: BoxFit.cover,
                    backgroundColor: isDark ? EColors.darkDarker30Per : EColors.lightDarker30Per,
                    border: Border.all(color: EColors.accent),
                    paddingAll: ESizes.xs,
                    imageUrl: EImages.productShoesAdidas3, //!!!
                  ),
                ),
              ),
            ),

            /// AppBar Icons
            EAppBar(
              showBackArrow: true,
              showBackgroundColorackArrow: true,
              actions: [
                ECircularIcon(
                  icon: Iconsax.heart5,
                  color: EColors.favourite,
                  height: EDeviceUtils.getAppBarHeight(),
                  width: EDeviceUtils.getAppBarHeight(),
                ), //!!!
              ],
            ),
          ],
        ),
      ),
    );
  }
}
