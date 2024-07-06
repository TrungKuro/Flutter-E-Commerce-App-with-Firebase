import 'dart:async';

import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find(); //!

  /* ------------------------------- Variable ------------------------------ */

  /* ------------------------------- Override ------------------------------ */

  /// Send email whenever [Verify Screen] appears & Set time for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Send "Email Verification" link.
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ELoaders.successSnackBar(
        title: ETexts.sentEmailSuccessTitle,
        message: ETexts.sentEmailSuccessMsg,
      );
    } catch (e) {
      ELoaders.errorSnackBar(title: ETexts.ohSnapTitle, message: e.toString());
    }
  }

  /// Timer to automatically redirect on "Email Verification".
  setTimerForAutoRedirect() async {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: EImages.successAnimation,
              title: ETexts.yourAccountCreatedTitle,
              subTitle: ETexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(), //?
            ),
          ); //?
        }
      },
    );
  }

  /// Manually check if email verified.
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: EImages.successAnimation,
          title: ETexts.yourAccountCreatedTitle,
          subTitle: ETexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(), //?
        ),
      ); //?
    }
  }

  /* ----------------------------------------------------------------------- */
}
