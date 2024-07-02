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
  //! Trong "You Might Like" trên trang Store
  static const int itemNumberOnRow = 2;

  /* ----------------------------------------------------------------------- */
  /*                               HOME SCREEN                               */
  /* ----------------------------------------------------------------------- */

  /* ------------------------ Header of Home Screen ------------------------ */

  //! Chiều cao phần Header trên trang [Home] --- no use
  // static const double heightHeaderHome = 410;

  /* ------------------------ Banner of Home Screen ------------------------ */

  //! Hiện cho hiển thị 5 {Banner} trên trang [Home]
  static const int promoBannerNumber = 5;

  //! Thời gian giữa mỗi lần chuyển {Banner} (tự động)
  static const Duration autoPlayInterval = Duration(seconds: 5);

  //! Thời gian thực hiện hoạt ảnh chuyển giữa các {Banner} (tự động)
  static const Duration autoPlayAnimationDuration = Duration(seconds: 1);

  /* ------------------- Popular Products of Home Screen ------------------- */

  //! Số item hiển thị trong "Popular Products" trên trang [Home]
  static const int popularProductNumber = 9;

  //! Độ cao của mỗi item hiển thị trong "Popular Products" trên trang [Home]
  static const double heightPopularProduct = 288;

  /* ----------------------------------------------------------------------- */
  /*                               STORE SCREEN                              */
  /* ----------------------------------------------------------------------- */

  /* ------------------------ Header of Store Screen ----------------------- */

  //! Chiều cao phần Header trên trang [Store]
  static const double heightHeaderStore = 440;

  /* ------------------- Featured Brands of Store Screen ------------------- */

  //! Số item hiển thị trong "Featured Brands" trên trang [Store]
  static const int featuredBrandNumber = 3;

  //! Độ cao của mỗi item hiển thị trong "Featured Brands" trên trang [Store]
  static const double heightFeaturedBrand = 80;

  //! Độ cao của mỗi item hiển thị trong "Top 3 Products Brand" trên trang [Store]
  static const double heightTop3ProductsBrand = 100;

  /* -------------------- You Might Like of Store Screen ------------------- */

  //! Số item hiển thị trong "You Might Like" trên trang [Store]
  static const int youMightLikeNumber = 5;

  /* ----------------------------------------------------------------------- */
  /*                               BRAND SCREEN                              */
  /* ----------------------------------------------------------------------- */

  //! Số item thương hiệu hiển thị trên trang [Brand]
  static const int brandsNumber = 15;

  /* ----------------------------------------------------------------------- */
  /*                             WISHLIST SCREEN                             */
  /* ----------------------------------------------------------------------- */

  //! Số item hiển thị trên trang [Wishlist]
  static const int wishlistNumber = 5;

  /* ----------------------------------------------------------------------- */
  /*                               CART SCREEN                               */
  /* ----------------------------------------------------------------------- */

  //! Số item hiển thị trên trang [Cart]
  static const int numberProductsInCart = 9;

  //! Độ cao của mỗi hình item hiển thị trên trang [Cart]
  static const double heightProductInCart = 70;

  /* ----------------------------------------------------------------------- */
  /*                          PRODUCT DETAIL SCREEN                          */
  /* ----------------------------------------------------------------------- */

  //! Độ cao của hình ảnh lớn hiển thị sản phẩm trên trang [Product Detail]
  static const double heightLargeImageProduct = 450;

  /* ----------------------------------------------------------------------- */

  //! Số item hiển thị các hình ảnh khác nhau của một sản phẩm trên trang [Product Detail]
  static const int productImageNumber = 5;

  //! Độ cao của item hiển thị các hình ảnh khác nhau của một sản phẩm trên trang [Product Detail]
  static const double heightImageProduct = 80;

  //! Độ rộng của item hiển thị các hình ảnh khác nhau của một sản phẩm trên trang [Product Detail]
  static const double widthImageProduct = 80;

  /* ----------------------------------------------------------------------- */

  //! Khoảng cách giữa các tuỳ chọn biến thể khác nhau của một sản phẩm trên trang [Product Detail]
  static const double spacingBetweenChosenAttributes = 8;

  /* ----------------------------------------------------------------------- */
  /*                             MY ORDERS SCREEN                            */
  /* ----------------------------------------------------------------------- */

  //! Số item hiển thị các đơn hàng của người dùng trên trang [My Orders]
  static const int userOrdersNumber = 5;
}
