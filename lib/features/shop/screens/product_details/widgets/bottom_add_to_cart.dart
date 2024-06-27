import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EBottomAddToCart extends StatelessWidget {
  const EBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Container(
      padding: EdgeInsets.only(
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        top: ESizes.defaultSpace,
        bottom: EDeviceUtils.getBottomNavigationBarHeight() * 0.7,
      ),
      decoration: BoxDecoration(
        color: isDark ? EColors.darkerGrey : EColors.grey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ESizes.cardRadiusLg),
          topRight: Radius.circular(ESizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ECircularIcon(
                icon: Iconsax.minus,
                backgroundColor: EColors.darkGrey,
                width: 40,
                height: 40,
                color: EColors.white,
              ),
              const SizedBox(width: ESizes.spaceBtwItems),
              Text(
                '2', //!!!
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: ESizes.spaceBtwItems),
              const ECircularIcon(
                icon: Iconsax.add,
                backgroundColor: EColors.black,
                width: 40,
                height: 40,
                color: EColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {}, //?
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(ESizes.md),
              backgroundColor: EColors.black,
              side: const BorderSide(color: EColors.black),
            ),
            child: const Text(ETexts.addToCart),
          ),
        ],
      ),
    );
  }
}
