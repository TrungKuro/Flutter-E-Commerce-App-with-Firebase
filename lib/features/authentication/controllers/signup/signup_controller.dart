import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/features/personalization/models/user_model.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  //! Observable for hiding/showing password
  final hidePassword = true.obs;

  //! Observable for privacy policy acceptance
  final privacyPolicy = false.obs;

  //! Form key for Form Validation
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// --- SIGNUP
  /// 1. Kiểm tra kết nối mạng.
  /// 2. Xác thực thông tin người dùng nhập vào.
  /// 3. Kiểm tra người dùng có chấp nhận "chính sách bảo mật" và "điều khoản sử dụng" của ứng dụng.
  /// 4. Tạo một tài khoản người dùng mới với địa chỉ email và mật khẩu đã cho. [firebase_auth].
  /// 5. Trích xuất từ thông tin người dùng nhập vào theo cấu trúc [UserModel].
  /// 6. Chuyển thông tin người dùng từ MODEL sang JSON và lưu vào Firebase Firestore. [cloud_firestore].
  /// 7. Đi tới màn hình [VerifyEmailScreen].
  Future<void> signup() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(
        ETexts.waitLoadingDialog,
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
      if (!signupFormKey.currentState!.validate()) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Stop function
        return;
      }

      // Check "Privacy Policy"
      if (!privacyPolicy.value) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Show reason message
        ELoaders.warningSnackBar(
          title: ETexts.acceptPrivacyPolicyTitle,
          message: ETexts.acceptPrivacyPolicyMsg,
        );
        // Stop function
        return;
      }

      //! Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      //! Create user information according to UserModel
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '', //!!!
      );

      //! Save Authenticated user data in the Firebase Firestore
      final userRepository = Get.put(UserRepository()); //!
      await userRepository.saveUserRecord(newUser);

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Move to [VerifyEmail Screen]
      Get.to(() => VerifyEmailScreen(email: email.text.trim())); //?

      // Show success message
      ELoaders.successSnackBar(
        title: ETexts.signUpSuccessTitle,
        message: ETexts.signUpSuccessMsg,
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
