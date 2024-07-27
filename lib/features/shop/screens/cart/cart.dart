import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        showBackArrow: true,
        title: Text(
          ETexts.cartScreenAppBarTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      /// Items in Cart
      body: Obx(() {
// Nothing found widget
        final emptyWidget = EAnimationLoader(
          text: 'Whoops! Cart in EMPTY.',
          animation: EImages.cartAnimation,
          showAction: true,
          actionText: "Let's fill it",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ESizes.defaultSpace),

              // Items in Cart
              child: ECartItems(),
            ),
          );
        }
      }),

      /* ------------------------------------------------------------------- */
      /*                                BOTTOM                               */
      /* ------------------------------------------------------------------- */

      /// Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.only(
                top: ESizes.defaultSpace,
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: EDeviceUtils.getBottomNavigationBarHeight(),
              ),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()), //?
                child: Obx(() => Text('${ETexts.checkOut} \$${controller.totalCartPrice.value}')),
              ),
            ),

      /* ------------------------------------------------------------------- */
    );
  }
}
