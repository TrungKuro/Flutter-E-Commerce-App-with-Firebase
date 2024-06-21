class ENumberConstants {
  //! Hàm xây dựng riêng tư
  ENumberConstants._();

  /* ------------------------------ OnBoarding ----------------------------- */

  //! Hiện có 3 trang OnBoarding
  //! Nên trang cuối cùng có Index là 2
  static const int onBoardingNumber = 3;

  /* -------------------------------- Banner ------------------------------- */

  //! Hiện cho hiển thị 5 Banner trên trang Home
  static const int promoBannerNumber = 5;

  //! Thời gian giữa mỗi lần chuyển Banner (tự động)
  static const Duration autoPlayInterval = Duration(seconds: 5);

  //! Thời gian thực hiện hoạt ảnh chuyển giữa các Banner (tự động)
  static const Duration autoPlayAnimationDuration = Duration(seconds: 1);
}
