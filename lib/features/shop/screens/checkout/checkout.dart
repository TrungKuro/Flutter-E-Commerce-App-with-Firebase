import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/products/cart/coupon_code.dart';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_section.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        showBackArrow: true,
        title: Text(ETexts.checkoutScreenAppBarTitle, style: Theme.of(context).textTheme.headlineSmall),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /* ----------------------------------------------------------- */

              /// Items in Cart
              ECartItems(
                showAddRemoveButtons: false,
                scrollable: false,
              ),
              SizedBox(height: ESizes.spaceBtwSections),

              /// Coupon TextField
              ECouponCode(),
              SizedBox(height: ESizes.spaceBtwSections),

              /// Billing Section
              EBillingSection(),

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
      /*                                BOTTOM                               */
      /* ------------------------------------------------------------------- */

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: ESizes.defaultSpace,
          left: ESizes.defaultSpace,
          right: ESizes.defaultSpace,
          bottom: EDeviceUtils.getBottomNavigationBarHeight(),
        ),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: EImages.successfulPaymentIcon,
                title: ETexts.successScreenAppBarTitle,
                subTitle: ETexts.successScreenAppBarSubTitle,
                onPressed: () => Get.offAll(() => const NavigationMenu()), //?
              )), //?
          child: const Text('${ETexts.checkOut} \$256.0'), //!!!
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
