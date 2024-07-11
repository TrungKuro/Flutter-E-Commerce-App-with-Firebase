import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ELoaders {
  /* ----------------------------------------------------------------------- */

  //! Thời gian xem thông báo mặc định, đơn vị giây
  static const int defaultTimeToView = 3;

  /* ----------------------------------------------------------------------- */

  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  /* ----------------------------------------------------------------------- */

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: defaultTimeToView),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: EHelperFunctions.isDarkMode(Get.context!)
                ? EColors.darkerGrey.withOpacity(0.9)
                : EColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  /* ----------------------------------------------------------------------- */

  static successSnackBar({required title, message = '', duration = defaultTimeToView}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.white,
      backgroundColor: EColors.success,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.only(
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        bottom: ESizes.defaultSpace,
      ),
      icon: const Icon(Iconsax.check, color: EColors.white),
    ); //?
  }

  /* ----------------------------------------------------------------------- */

  static warningSnackBar({required title, message = '', duration = defaultTimeToView}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.white,
      backgroundColor: EColors.warning,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.only(
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        bottom: ESizes.defaultSpace,
      ),
      icon: const Icon(Iconsax.warning_2, color: EColors.white),
    ); //?
  }

  /* ----------------------------------------------------------------------- */

  static errorSnackBar({required title, message = '', duration = defaultTimeToView}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.white,
      backgroundColor: EColors.error,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.only(
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        bottom: ESizes.defaultSpace,
      ),
      icon: const Icon(Icons.error, color: EColors.white),
    ); //?
  }

  /* ----------------------------------------------------------------------- */
}
