import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        showBackArrow: true,
        title: Text(ETexts.cartScreenAppBarTitle, style: Theme.of(context).textTheme.headlineSmall),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      /// Items in Cart
      body: const Padding(
        padding: EdgeInsets.all(ESizes.defaultSpace),
        child: ECartItems(),
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
          onPressed: () => Get.to(() => const CheckoutScreen()), //?
          child: const Text('Checkout \$256.0'), //!!!
        ),
      ),
    );
  }
}
