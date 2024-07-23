import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

class EBrandsShimmer extends StatelessWidget {
  const EBrandsShimmer({
    super.key,
    this.itemCount = 4, //!!!
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EGridLayout(
      mainAxisExtent: 80, //!!!
      itemCount: itemCount,
      //?
      itemBuilder: (_, __) => const EShimmerEffect(width: 300, height: 80),
    );
  }
}
