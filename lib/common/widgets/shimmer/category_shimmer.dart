import 'package:e_commerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ECategoryShimmer extends StatelessWidget {
  const ECategoryShimmer({
    super.key,
    this.itemCount = ENumberConstants.categoriesProductNumber, //! For test UI
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace),
        separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
        itemBuilder: (_, index) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Circular Icon
              EShimmerEffect(
                width: 60,
                height: 60,
                radius: 60,
              ),

              /// Text
              SizedBox(height: ESizes.spaceBtwItems / 2),
              SizedBox(width: 60, height: 8),
            ],
          );
        },
      ),
    );
  }
}
