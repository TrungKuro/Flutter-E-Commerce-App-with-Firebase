import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/navigation_menu.dart';
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
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  //! Sử dụng gói "get_storage"
  final deviceStorage = GetStorage();

  //! Sử dụng gói "firebase_auth"
  final _auth = FirebaseAuth.instance;

  /* ----------------------------------------------------------------------- */
  /*                                 OVERRIDE                                */
  /* ----------------------------------------------------------------------- */

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
  void screenRedirect() async {
    final user = _auth.currentUser;

    //! For Debug
    if (kDebugMode) {
      print("=== GET STORAGE Auth Repo ===");
      print(deviceStorage.read(ETexts.getxIsFirstTime));
    }

    if (user != null) {
      // If the user is logged in
      if (user.emailVerified) {
        // If the user's email is verified, navigate to the main [Navigation Menu]
        Get.offAll(() => const NavigationMenu()); //?
      } else {
        // If the user's email is not verified, navigate to the [Verify Email Screen]
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email)); //?
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull(ETexts.getxIsFirstTime, true);
      // Check if it's the first time launching the app
      deviceStorage.read(ETexts.getxIsFirstTime) != true
          // Redirect to [Login Screen] if not the first time
          ? Get.offAll(() => const LoginScreen()) //?
          // Redirect to [OnBoarding Screen] if it's the first time
          : Get.offAll(() => const OnBoardingScreen()); //?
    }
  }

  /* ----------------------- Email & Password sign-in ---------------------- */

  /// [Email Authentication] - LOGIN (SIGNIN).
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      /* ------------------------------------------------------------------- */

      return await _auth.signInWithEmailAndPassword(email: email, password: password);

      /* ------------------------------------------------------------------- */
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

  /// [Email Authentication] - REGISTER (SIGNUP).
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      /* ------------------------------------------------------------------- */

      return await _auth.createUserWithEmailAndPassword(email: email, password: password);

      /* ------------------------------------------------------------------- */
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

  /// [Email Verification] - Mail Verification.
  Future<void> sendEmailVerification() async {
    try {
      /* ------------------------------------------------------------------- */

      return await _auth.currentUser?.sendEmailVerification();

      /* ------------------------------------------------------------------- */
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

  /// [Email Authentication] - Forget Password.

  /* ----------------- Federated identity & social sign-in ----------------- */

  /// [Google Authentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      /* ------------------------------------------------------------------- */

      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);

      /* ------------------------------------------------------------------- */
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// [Facebook Authentication] - FACEBOOK

  /* -------------- ./end Federated identity & Social sign-in -------------- */

  /// [Logout User] - Valid for any Authentication.
  Future<void> logout() async {
    try {
      /* ------------------------------------------------------------------- */

      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen()); //?

      /* ------------------------------------------------------------------- */
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

  /// [Delete User] - Remove user Auth and Firestore Account.

  /* ----------------------------------------------------------------------- */
}
