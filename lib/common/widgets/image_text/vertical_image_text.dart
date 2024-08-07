import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EVerticalImageText extends StatelessWidget {
  const EVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = EColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return GestureDetector(
      onTap: onTap, //?
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Circular Icon
          // Container(
          //   width: 60,
          //   height: 60,
          //   padding: const EdgeInsets.all(ESizes.sm + ESizes.xs),
          //   decoration: BoxDecoration(
          //     color: backgroundColor ?? (isDark ? EColors.black : EColors.white),
          //     borderRadius: BorderRadius.circular(100),
          //   ),
          //   child: Center(
          //     child: Image(
          //       image: AssetImage(image),
          //       fit: BoxFit.cover,
          //       color: isDark ? EColors.light : EColors.dark,
          //     ),
          //   ),
          // ),
          //!!!!! test lại
          ECircularImage(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(ESizes.sm + ESizes.xs),
            backgroundColor: backgroundColor,
            overlayColor: isDark ? EColors.light : EColors.dark,
            isNetworkImage: isNetworkImage,
            image: image,
          ),

          /// Text
          const SizedBox(height: ESizes.spaceBtwItems / 2),
          SizedBox(
            width: 60,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
