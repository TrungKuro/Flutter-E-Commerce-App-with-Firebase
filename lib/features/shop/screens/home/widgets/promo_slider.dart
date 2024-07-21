import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/features/shop/controllers/banner_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EPromoSlider extends StatelessWidget {
  const EPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController()); //!

    return Obx(
      () {
        // Loader
        if (controller.isLoading.value) return const EShimmerEffect(width: double.infinity, height: 190);

        // No data sound
        if (controller.banners.isEmpty) {
          return const Center(child: Text(ETexts.noDataFound));
        } else {
          return Column(
            children: [
              /* ----------------------------------------------------------- */

              /// Banner
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: ENumberConstants.autoPlayInterval,
                  autoPlayAnimationDuration: ENumberConstants.autoPlayAnimationDuration,
                  onPageChanged: (index, _) => controller.updatePageIndicator(index),
                ),
                items: controller.banners
                    .map((banner) => ERoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen), //?
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          padding: const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace),
                          backgroundColor: Colors.transparent,
                        ))
                    .toList(),
              ),

              /* ----------------------------------------------------------- */

              /// Divider
              const SizedBox(height: ESizes.spaceBtwItems),

              /* ----------------------------------------------------------- */

              /// Dot Navigation for Banner
              Center(
                //! To view observable variable ... of [BannerController]
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        ECircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carouselCurrentIndex.value == i ? EColors.primary : EColors.grey,
                        ),
                    ],
                  ),
                ),
              ),

              /* ----------------------------------------------------------- */
            ],
          );
        }
      },
    );
  }
}
