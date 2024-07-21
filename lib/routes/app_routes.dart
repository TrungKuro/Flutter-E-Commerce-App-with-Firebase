import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/features/personalization/screens/address/user_address.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/personalization/screens/settings/settings.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:e_commerce_app/features/shop/screens/order/order.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/features/shop/screens/wishlist/favourite.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: ERoutes.home, page: () => const HomeScreen()),
    GetPage(name: ERoutes.store, page: () => const StoreScreen()),
    GetPage(name: ERoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: ERoutes.settings, page: () => const SettingsScreen()),

    GetPage(name: ERoutes.order, page: () => const OrderScreen()),
    GetPage(name: ERoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: ERoutes.cart, page: () => const CartScreen()),

    // allProducts
    // brand
    // subCategories

    GetPage(name: ERoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: ERoutes.productDetail, page: () => const ProductDetailsScreen()),

    // search

    GetPage(name: ERoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: ERoutes.userAddress, page: () => const UserAddressScreen()),

    GetPage(name: ERoutes.signUp, page: () => const SignUpScreen()),
    // signupSuccess
    GetPage(name: ERoutes.verifyEmail, page: () => const VerifyEmailScreen()),

    GetPage(name: ERoutes.signIn, page: () => const LoginScreen()),
    // resetPassword
    GetPage(name: ERoutes.forgetPassword, page: () => const ForgetPasswordScreen()),

    GetPage(name: ERoutes.onBoarding, page: () => const OnBoardingScreen()),

    //! Add more GetPage entries as needed.
  ];
}
