import 'package:e_commerce_app/data/repositories/banners/banner_repository.dart';
import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  //! Observable
  final carouselCurrentIndex = 0.obs;

  //! Observable
  final isLoading = false.obs;

  //! Observable
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  /* ----------------------------------------------------------------------- */
  /*                                 OVERRIDE                                */
  /* ----------------------------------------------------------------------- */

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// UPDATE --- current index when page scroll.
  void updatePageIndicator(int index) => carouselCurrentIndex.value = index;

  /// FETCH --- banners.
  Future<void> fetchBanners() async {
    try {
      /* ------------------------------------------------------------------- */

      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners
      final bannerRepo = Get.put(BannerRepository()); //!
      final banners = await bannerRepo.fetchBanners();

      // Assign banners
      this.banners.assignAll(banners);

      /* ------------------------------------------------------------------- */
    } catch (e) {
      ELoaders.errorSnackBar(
        title: ETexts.ohSnapTitle,
        message: e.toString(),
      );
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  /* ----------------------------------------------------------------------- */
}
