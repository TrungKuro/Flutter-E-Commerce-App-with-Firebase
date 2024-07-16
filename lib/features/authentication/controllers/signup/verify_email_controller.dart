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

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  /// Bộ hẹn giờ kiểm tra "xác thực email" liên tục
  final timerCheck = Timer(
    Duration.zero,
    () {},
  );

  /* ----------------------------------------------------------------------- */
  /*                                 OVERRIDE                                */
  /* ----------------------------------------------------------------------- */

  /// Send email whenever [Verify Screen] appears & Set time for auto redirect.
  /// 1. Ngay khi vừa chuyển đến màn hình này, ứng dụng sẽ gửi lại "email xác thực".
  /// 2. Đồng thời thiết lập bộ hẹn giờ để kiểm tra liên tục xem người dùng có xác thực hay chưa?
  /// 3. Nếu người dùng xác thực rồi, tự động chuyển đến màn hình [SuccessScreen].
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  /// Dispose or close the active timer.
  /// 1. Điều này đảm bảo bộ Timer được tắt hoàn toàn.
  ///    Trong trường hợp người dùng không xác thực liền mà thoát màn hình [VerifyEmail Screen].
  ///    Sau đó họ mới "xác thực email" và đăng nhập lại trên màn [Login Screen].
  @override
  void onClose() {
    super.onClose();
    timerCheck.cancel(); //!
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Send "Email Verification" link.
  /// 1. Yêu cầu dịch vụ xác thực của Firebase gửi email lại. [firebase_auth].
  Future<void> sendEmailVerification() async {
    try {
      /* ------------------------------------------------------------------- */

      //! Send verification email again
      await AuthenticationRepository.instance.sendEmailVerification();

      // Show success message
      ELoaders.successSnackBar(
        title: ETexts.sentEmailSuccessTitle,
        message: ETexts.receivedEmailVerifiMsg,
      );

      /* ------------------------------------------------------------------- */
    } catch (e) {
      /* ------------------------------------------------------------------- */

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(
        title: ETexts.ohSnapTitle,
        message: e.toString(),
      );

      /* ------------------------------------------------------------------- */
    }
  }

  /// Timer to automatically redirect on "Email Verification".
  /// 1. Thiết lập bộ hẹn giờ để thực hiện lặp lại liên tục.
  /// 2. Làm mới người dùng hiện tại nếu đã đăng nhập. [firebase_auth].
  /// 3. Nếu phát hiện người dùng đã xác thực, cho huỷ bộ hẹn giờ.
  ///    Rồi chuyển đến màn hình [SuccessScreen].
  Future<void> setTimerForAutoRedirect() async {
    Timer.periodic(
      const Duration(seconds: 1),
      (timerCheck) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timerCheck.cancel(); //!
          Get.to(
            () => SuccessScreen(
              isImgJson: true,
              image: EImages.successAnimation,
              title: ETexts.yourAccountCreatedTitle,
              subTitle: ETexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(), //?
            ),
          ); //?
        }
      },
    ); //!
  }


  //! Với tính năng "tự động kiểm tra xác thực" thì hầu như lệnh này không được dùng tới.
  /// Manually check if email verified.
  /// 1. Kiểm tra có tài khoản nào đang đăng nhập chưa?
  /// 2. Nếu rồi thì kiểm tra tài khoản đó có được xác thực qua email chưa?
  /// 3. Nếu rồi thì chuyển đến màn hình [SuccessScreen].
  ///    Ngược lại thì thông báo tài khoản chưa được xác thực.
  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.to(
        () => SuccessScreen(
          image: EImages.staticSuccessIllustration,
          title: ETexts.yourAccountCreatedTitle,
          subTitle: ETexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(), //?
        ),
      ); //?
    } else {
      // Show reason message
      ELoaders.warningSnackBar(
        title: ETexts.unverifiedEmailTitle,
        message: ETexts.unverifiedEmailMsg,
      );
    }
  }

  /* ----------------------------------------------------------------------- */
}
