import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/features/shop/controllers/home/home_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EPromoSlider extends StatelessWidget {
  const EPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController()); //!

    return Column(
      children: [
        /// Banner
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: ENumberConstants.autoPlayInterval,
            autoPlayAnimationDuration: ENumberConstants.autoPlayAnimationDuration,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners
              .map((url) => ERoundedImage(
                    imageUrl: url,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ))
              .toList(),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /// Dot Navigation for Banner
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
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
      ],
    );
  }
}
