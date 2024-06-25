import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ECartCounterIcon extends StatelessWidget {
  const ECartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Stack(
      children: [
        /// Icon & Button
        IconButton(
          onPressed: onPressed, //?
          icon: const Icon(Iconsax.shopping_bag),
          color: (iconColor) ?? (isDark ? EColors.white : EColors.black),
        ),

        /// Number of products in the shopping cart
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: (iconColor != null) ? (EColors.black.withOpacity(0.5)) : (isDark ? EColors.white : EColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2', //!!!
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: (iconColor != null) ? (EColors.white) : (isDark ? EColors.black : EColors.white),
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
