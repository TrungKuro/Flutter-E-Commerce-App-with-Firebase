import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find(); //!

  /* ------------------------------- Variable ------------------------------ */

  final email = TextEditingController();
  final password = TextEditingController();

  //! Observable for hiding/showing password
  final hidePassword = true.obs;

  //! Observable to accept password memorization
  final rememberMe = false.obs;

  //! Sử dụng gói "get_storage"
  final localStorage = GetStorage();

  //! Form key for Form Validation
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /* ------------------------------- Override ------------------------------ */

  /// Automatically fill in remembered information on the form.
  @override
  void onInit() {
    email.text = localStorage.read(ETexts.getxRememberEmail);
    password.text = localStorage.read(ETexts.getxRememberPass);
    super.onInit();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// --- LOGIN
  Future<void> emailAndPasswordSignIn() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(ETexts.waitLoggingDialog, EImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        EFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        EFullScreenLoader.stopLoading();
        return;
      }

      // Save data if Remember Me is selected
      if (!rememberMe.value) {
        localStorage.write(ETexts.getxRememberEmail, email.text.trim());
        localStorage.write(ETexts.getxRememberPass, password.text.trim());
      }

      // Login user using Email & Password Authentication
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

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
