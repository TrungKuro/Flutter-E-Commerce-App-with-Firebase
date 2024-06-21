import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EGridLayout extends StatelessWidget {
  const EGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = ENumberConstants.heightPopularProduct,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ENumberConstants.itemNumberOnRow,
        mainAxisSpacing: ESizes.gridViewSpacing,
        crossAxisSpacing: ESizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
