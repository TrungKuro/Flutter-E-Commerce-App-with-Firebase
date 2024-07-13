import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EShimmerEffect extends StatelessWidget {
  const EShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Shimmer.fromColors(
      baseColor: isDark ? EColors.darkShimmerBase! : EColors.lightShimmerBase!,
      highlightColor: isDark ? EColors.darkShimmerHightLight! : EColors.lightShimmerHightLight!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (isDark ? EColors.darkerGrey : EColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
