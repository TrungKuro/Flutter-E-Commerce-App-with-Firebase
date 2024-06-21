import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ECircularIcon extends StatelessWidget {
  const ECircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = ESizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: (backgroundColor) ?? (isDark ? EColors.black.withOpacity(0.9) : EColors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {}, //!
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
