import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
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

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  final email = TextEditingController();
  final password = TextEditingController();

  final userController = Get.put(UserController()); //!

  //! Observable for hiding/showing password
  final hidePassword = true.obs;

  //! Observable to accept password memorization
  final rememberMe = false.obs;

  //! Sử dụng gói "get_storage"
  final localStorage = GetStorage();

  //! Form key for Form Validation
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /* ----------------------------------------------------------------------- */
  /*                                 OVERRIDE                                */
  /* ----------------------------------------------------------------------- */

  /// Automatically fill in remembered information on the form.
  @override
  void onInit() {
    email.text = localStorage.read(ETexts.getxRememberEmail) ?? '';
    password.text = localStorage.read(ETexts.getxRememberPass) ?? '';
    super.onInit();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// --- LOGIN (Email & Password SignIn)
  /// 1. Kiểm tra kết nối mạng.
  /// 2. Xác thực thông tin người dùng nhập vào.
  /// 3. Lưu sẵn thông tin đăng nhập cho lần tới nếu "Remember Me" được chọn
  /// 4. Đăng nhập người dùng bằng Email/Pass. [firebase_auth].
  /// 5. Tuỳ ngữ cảnh sẽ đi tới màn hình phù hợp.
  Future<void> emailAndPasswordSignIn() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(
        ETexts.waitLoggingDialog,
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
      if (!loginFormKey.currentState!.validate()) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Stop function
        return;
      }

      // Save data if "Remember Me" is selected
      if (rememberMe.value) {
        localStorage.write(ETexts.getxRememberEmail, email.text.trim());
        localStorage.write(ETexts.getxRememberPass, password.text.trim());
      }

      //! Login user using Email & Password Authentication
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Redirect for screen
      AuthenticationRepository.instance.screenRedirect();

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

  /// --- LOGIN with GOOGLE (Google SignIn Authentication)
  /// 1. Kiểm tra kết nối mạng.
  /// 2. ĐĂNG NHẬP (hoặc ĐĂNG KÝ nếu lần đầu) và cả XÁC THỰC người dùng bằng dịch vụ của Google. [google_sign_in].
  /// 3. Trích xuất từ thông tin người dùng từ tài khoản Google theo cấu trúc [UserModel].
  /// 4. Chuyển thông tin người dùng từ MODEL sang JSON và lưu vào Firebase Firestore. [cloud_firestore].
  /// 5. Tuỳ ngữ cảnh sẽ đi tới màn hình phù hợp.
  Future<void> googleSignIn() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(
        ETexts.waitLoggingDialog,
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

      //! Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      //! Save User Record
      await userController.saveUserRecord(userCredentials);

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Redirect for screen
      AuthenticationRepository.instance.screenRedirect();

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

  /// --- LOGIN with FACEBOOK (Facebook SignIn Authentication)

  /* ----------------------------------------------------------------------- */
}
