import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find(); //!

  /// Variables.
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

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
      Get.offAll(() => const LoginScreen()); //!
    } else {
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  /// Update current index & Jump to the last page.
  void skipPage() {
    currentPageIndex.value = ENumberConstants.onBoardingNumber - 1;
    pageController.jumpToPage(currentPageIndex.value);
  }
}
