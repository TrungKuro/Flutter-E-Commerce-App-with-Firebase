import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find(); //!

  /// Variables.
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch.
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen.
  screenRedirect() async {
    /* --------------------------- Local Storage --------------------------- */

    if (kDebugMode) {
      print("=== GET STORAGE Auth Repo ===");
      print(deviceStorage.read(ETexts.getxIsFirstTime));
    }

    deviceStorage.writeIfNull(ETexts.getxIsFirstTime, true);
    deviceStorage.read(ETexts.getxIsFirstTime) != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());

    /* --------------------------------------------------------------------- */
  }

  /* ----------------------- Email & Password sign-in ---------------------- */

  /// [Email Authentication] - SignIn.
  /// [Email Authentication] - Register.
  /// [ReAuthenticate] - ReAuthenticate User.
  /// [Email Verification] - Mail Verification.
  /// [Email Authentication] - Forget Password.

  /* ----------------- Federated identity & social sign-in ----------------- */

  /// [Google Authentication] - GOOGLE
  /// [Facebook Authentication] - FACEBOOK

  /* -------------- ./end Federated identity & Social sign-in -------------- */

  /// [Logout User] - Valid for any Authentication.
  /// [Delete User] - Remove user Auth and Firestore Account.
}
