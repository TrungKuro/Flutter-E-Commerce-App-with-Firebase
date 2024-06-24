class ENumberConstants {
  //? Hàm xây dựng riêng tư
  ENumberConstants._();

  /* ----------------------------------------------------------------------- */
  /*                                ONBOARDING                               */
  /* ----------------------------------------------------------------------- */

  //! Hiện có 3 trang OnBoarding
  //! Nên trang cuối cùng có Index là 2
  static const int onBoardingNumber = 3;

  /* ----------------------------------------------------------------------- */
  /*                                  COMMON                                 */
  /* ----------------------------------------------------------------------- */

  //! Số item hiển thị trên mỗi dòng
  //! Trong "Popular Products" trên trang Home
  //! Trong "Featured Brands" trên trang Store
  static const int itemNumberOnRow = 2;

  /* ----------------------------------------------------------------------- */
  /*                               HOME SCREEN                               */
  /* ----------------------------------------------------------------------- */

  /* ------------------------ Header of Home Screen ------------------------ */

  //! Chiều cao phần Header trên trang Home
  static const double heightHeaderHome = 410;

  /* ------------------------ Banner of Home Screen ------------------------ */

  //! Hiện cho hiển thị 5 Banner trên trang Home
  static const int promoBannerNumber = 5;

  //! Thời gian giữa mỗi lần chuyển Banner (tự động)
  static const Duration autoPlayInterval = Duration(seconds: 5);

  //! Thời gian thực hiện hoạt ảnh chuyển giữa các Banner (tự động)
  static const Duration autoPlayAnimationDuration = Duration(seconds: 1);

  /* ------------------- Popular Products of Home Screen ------------------- */

  //! Số item hiển thị trong "Popular Products" trên trang Home
  static const int popularProductNumber = 9;

  //! Độ cao của mỗi item hiển thị trong "Popular Products" trên trang Home
  static const double heightPopularProduct = 288;

  /* ----------------------------------------------------------------------- */
  /*                               STORE SCREEN                              */
  /* ----------------------------------------------------------------------- */

  /* ------------------------ Header of Store Screen ----------------------- */

  //! Chiều cao phần Header trên trang Store
  static const double heightHeaderStore = 440;

  /* ------------------- Featured Brands of Store Screen ------------------- */

  //! Số item hiển thị trong "Featured Brands" trên trang Store
  static const int featuredBrandNumber = 3;

  //! Độ cao của mỗi item hiển thị trong "Featured Brands" trên trang Store
  static const double heightFeaturedBrand = 80;
}
