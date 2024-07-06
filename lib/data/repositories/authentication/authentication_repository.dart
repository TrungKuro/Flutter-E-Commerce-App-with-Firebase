import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/foundation.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find(); //!

  /* ------------------------------- Variable ------------------------------ */

  final deviceStorage = GetStorage();

  final _auth = FirebaseAuth.instance;

  /* ------------------------------- Override ------------------------------ */

  /// Called from main.dart on app launch.
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate
    screenRedirect();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Function to show relevant screen.
  screenRedirect() async {
    /* --------------------------- Local Storage --------------------------- */

    //! For Debug
    if (kDebugMode) {
      print("=== GET STORAGE Auth Repo ===");
      print(deviceStorage.read(ETexts.getxIsFirstTime));
    }

    // Local Storage
    deviceStorage.writeIfNull(ETexts.getxIsFirstTime, true);
    // Check if it's the first time launching the app
    deviceStorage.read(ETexts.getxIsFirstTime) != true
        // Redirect to [Login Screen] if not the first time
        ? Get.offAll(() => const LoginScreen()) //?
        // Redirect to [OnBoarding Screen] if it's the first time
        : Get.offAll(() => const OnBoardingScreen()); //?

    /* --------------------------------------------------------------------- */
  }

  /* ----------------------- Email & Password sign-in ---------------------- */

  /// [Email Authentication] - SignIn.

  /// [Email Authentication] - Register.
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User.

  /// [Email Verification] - Mail Verification.

  /// [Email Authentication] - Forget Password.

  /* ----------------- Federated identity & social sign-in ----------------- */

  /// [Google Authentication] - GOOGLE

  /// [Facebook Authentication] - FACEBOOK

  /* -------------- ./end Federated identity & Social sign-in -------------- */

  /// [Logout User] - Valid for any Authentication.

  /// [Delete User] - Remove user Auth and Firestore Account.

  /* ----------------------------------------------------------------------- */
}
