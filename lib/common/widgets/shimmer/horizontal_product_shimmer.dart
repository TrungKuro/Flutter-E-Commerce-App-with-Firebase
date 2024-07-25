import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

//!!!!! 50 7:26
class EHorizontalProductShimmer extends StatelessWidget {
  const EHorizontalProductShimmer({
    super.key,
    this.itemCount = 4, //!!! có liên quan hằng số
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EGridLayout(
      itemCount: itemCount,
//?
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            EShimmerEffect(width: 120, height: 120),
            SizedBox(width: ESizes.spaceBtwItems),

            /// Text
            EShimmerEffect(width: 160, height: 15),
            SizedBox(height: ESizes.spaceBtwItems / 2),
            EShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
