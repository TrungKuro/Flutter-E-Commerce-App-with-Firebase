import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables.
  final pageController = PageController();
  Rx<int> currentPageIndex = Rx<int>(0);

  /// Update current index when page scroll.
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current index & Jump to the next page.
  void nextPage() {
    // Hiện có 3 trang OnBoarding, nên trang cuối cùng có Index là 2
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen()); //!
    } else {
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  /// Update current index & Jump to the last page.
  void skipPage() {
    // Hiện có 3 trang OnBoarding, nên trang cuối cùng có Index là 2
    currentPageIndex.value = 2;
    pageController.jumpToPage(currentPageIndex.value);
  }
}
