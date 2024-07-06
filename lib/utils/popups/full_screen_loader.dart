import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A utility class for managing a full-screen loading dialog.
class EFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method does't return anything.
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog.
  ///   - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible: false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the Back button
        child: Container(
          color: EHelperFunctions.isDarkMode(Get.context!) ? EColors.dark : EColors.white,
          child: EAnimationLoader(text: text, animation: animation),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.
  /// This method does't return anything.
  static stopLoading() {
    //! Close the dialog using the Navigator
    Navigator.of(Get.overlayContext!).pop(); //?
  }
}
