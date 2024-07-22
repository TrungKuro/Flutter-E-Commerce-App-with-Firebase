import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EProductDetailImageSlider extends StatelessWidget {
  const EProductDetailImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    final controller = Get.put(ImagesController()); //!!!
    final images = controller.getAllProductImages(product); //!!!

    return ECurvedEdgeWidget(
      child: Container(
        color: isDark ? EColors.darkDarker30Per : EColors.lightDarker30Per,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: ENumberConstants.heightLargeImageProduct,
              child: Obx(
                () {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image), //?
                    child: CachedNetworkImage(
                      imageUrl: image,
                      //?
                      progressIndicatorBuilder: (_, __, downloadProgress) => CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: EColors.primary,
                      ),
                    ),
                  );
                },
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
                  itemCount: images.length, //ENumberConstants.productImageNumber
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  //? Dấu (__) nghĩa là gì, nó khác gì với dấu (_)
                  separatorBuilder: (_, __) => const SizedBox(width: ESizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return ERoundedImage(
                        width: ENumberConstants.widthImageProduct,
                        fit: BoxFit.cover,
                        isNetworkImage: true,
                        imageUrl: images[index],
                        paddingAll: ESizes.xs,
                        backgroundColor: isDark ? EColors.darkDarker30Per : EColors.lightDarker30Per,
                        onPressed: () => controller.selectedProductImage.value = images[index], //?
                        border: Border.all(color: imageSelected ? EColors.accent : Colors.transparent),
                      );
                    },
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
