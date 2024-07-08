import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  final pageController = PageController();

  Rx<int> currentPageIndex = 0.obs;

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Update current index when page scroll.
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current index & Jump to the next page.
  void nextPage() {
    if (currentPageIndex.value == ENumberConstants.onBoardingNumber - 1) {
      /* ------------------------------------------------------------------- */

      //! Sử dụng gói "get_storage"
      final storage = GetStorage();

      //! For Debug
      if (kDebugMode) {
        print("=== GET STORAGE Next Button ===");
        print(storage.read(ETexts.getxIsFirstTime));
      }

      storage.write(ETexts.getxIsFirstTime, false);

      //! For Debug
      if (kDebugMode) {
        print("=== GET STORAGE Next Button ===");
        print(storage.read(ETexts.getxIsFirstTime));
      }

      Get.offAll(() => const LoginScreen()); //?

      /* ------------------------------------------------------------------- */
    } else {
      /* ------------------------------------------------------------------- */

      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.jumpToPage(currentPageIndex.value);

      /* ------------------------------------------------------------------- */
    }
  }

  /// Update current index & Jump to the last page.
  void skipPage() {
    currentPageIndex.value = ENumberConstants.onBoardingNumber - 1;
    pageController.jumpToPage(currentPageIndex.value);
  }

  /* ----------------------------------------------------------------------- */
}
