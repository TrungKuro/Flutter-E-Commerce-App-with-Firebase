import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  final email = TextEditingController();

  //! Form key for Form Validation
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Send reset password email
  sendPasswordResetEmail() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(ETexts.waitResponsesDialog, EImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        EFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        EFullScreenLoader.stopLoading();
        return;
      }

      // Login user using Email & Password Authentication
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Show [Success Screen]
      ELoaders.successSnackBar(
        title: ETexts.sentEmailSuccessTitle,
        message: ETexts.receivedEmailSuccessMsg,
      );

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
      Get.to(() => ResetPasswordScreen(email: email.text.trim())); //?

      /* ------------------------------------------------------------------- */
    } catch (e) {
      /* ------------------------------------------------------------------- */

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(title: ETexts.ohSnapTitle, message: e.toString());

      /* ------------------------------------------------------------------- */
    }
  }

  /// Resend reset password email
  resendPasswordResetEmail(String email) async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(ETexts.waitResponsesDialog, EImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        EFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Show [Success Screen]
      ELoaders.successSnackBar(
        title: ETexts.sentEmailSuccessTitle,
        message: ETexts.receivedEmailSuccessMsg,
      );

      /* ------------------------------------------------------------------- */
    } catch (e) {
      /* ------------------------------------------------------------------- */

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(title: ETexts.ohSnapTitle, message: e.toString());

      /* ------------------------------------------------------------------- */
    }
  }

  /* ----------------------------------------------------------------------- */
}
