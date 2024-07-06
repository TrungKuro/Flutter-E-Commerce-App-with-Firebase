import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find(); //!

  /* ------------------------------- Variable ------------------------------ */

  final carouselCurrentIndex = 0.obs;

  /* ------------------------------- Function ------------------------------ */

  /// Update current index when page scroll.
  void updatePageIndicator(int index) => carouselCurrentIndex.value = index;

  /* ----------------------------------------------------------------------- */
}
