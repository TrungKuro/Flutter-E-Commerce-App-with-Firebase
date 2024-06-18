import 'package:e_commerce_app/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance; //!
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Positioned(
        bottom: EDeviceUtils.getBottomNavigationBarHeight(),
        right: ESizes.defaultSpace,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: isDark ? EColors.primary : Colors.black,
          ),
          onPressed: () => controller.nextPage(), //!
          child: const Icon(
            Iconsax.arrow_right_3,
          ),
        ));
  }
}
