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

  /// --- SEND (reset password email)
  /// 1. Kiểm tra kết nối mạng.
  /// 2. Xác thực thông tin người dùng nhập vào.
  /// 3. Gửi email đặt lại mật khẩu đến địa chỉ email đã cho. [firebase_auth].
  /// 4. Đi tới màn hình [ResetPasswordScreen].
  Future<void> sendPasswordResetEmail() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(
        ETexts.waitResponsesDialog,
        EImages.loadingAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Show reason message
        ELoaders.warningSnackBar(
          title: ETexts.noInternetTitle,
          message: ETexts.noInternetMsg,
        );
        // Stop function
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Stop function
        return;
      }

      // Sends a password reset email to the given email address
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Show success message
      ELoaders.successSnackBar(
        title: ETexts.sentEmailSuccessTitle,
        message: ETexts.receivedEmailResetMsg,
      );

      // Move to [ResetPassword Screen]
      Get.off(() => ResetPasswordScreen(email: email.text.trim())); //?

      /* ------------------------------------------------------------------- */
    } catch (e) {
      /* ------------------------------------------------------------------- */

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(
        title: ETexts.ohSnapTitle,
        message: e.toString(),
      );

      /* ------------------------------------------------------------------- */
    }
  }

  /// --- RESEND (reset password email)
  /// 1. Kiểm tra kết nối mạng.
  /// 2. Gửi email đặt lại mật khẩu đến địa chỉ email đã cho. [firebase_auth].
  Future<void> resendPasswordResetEmail(String email) async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(
        ETexts.waitResponsesDialog,
        EImages.loadingAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Show reason message
        ELoaders.warningSnackBar(
          title: ETexts.noInternetTitle,
          message: ETexts.noInternetMsg,
        );
        // Stop function
        return;
      }

      // Sends a password reset email to the given email address
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Show success message
      ELoaders.successSnackBar(
        title: ETexts.sentEmailSuccessTitle,
        message: ETexts.receivedEmailResetMsg,
      );

      /* ------------------------------------------------------------------- */
    } catch (e) {
      /* ------------------------------------------------------------------- */

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(
        title: ETexts.ohSnapTitle,
        message: e.toString(),
      );

      /* ------------------------------------------------------------------- */
    }
  }

  /* ----------------------------------------------------------------------- */
}
