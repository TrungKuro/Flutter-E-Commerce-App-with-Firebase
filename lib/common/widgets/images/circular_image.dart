import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding,
    this.isClip = true,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height;
  final EdgeInsetsGeometry? padding;
  final bool isClip;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        //! If image background color is null then switch it to light and dark mode color design
        color: (backgroundColor) ?? (isDark ? EColors.black : EColors.white),
        shape: BoxShape.circle,
      ),
      child: isClip
          ? ClipOval(
              child: Image(
                fit: fit,
                image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
                color: overlayColor,
              ),
            )
          : Image(
              fit: fit,
              image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
              color: overlayColor,
            ),
    );
  }
}
