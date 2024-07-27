import 'package:e_commerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce_app/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:e_commerce_app/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({
    super.key,
    this.showAddRemoveButtons = true,
    this.scrollable = true,
  });

  final bool showAddRemoveButtons;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        physics: scrollable ? null : const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        //? Dấu (__) nghĩa là gì, nó khác gì với dấu (_)
        separatorBuilder: (_, __) => const SizedBox(height: ESizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              // Cart item
              ECartItem(
                showAddRemoveButtons: showAddRemoveButtons,
                cartItem: item,
              ),
              if (showAddRemoveButtons) const SizedBox(height: ESizes.spaceBtwItems),

              // Add remove button row with total price
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Extra space
                        const SizedBox(width: 70),
                        // Add remove buttons
                        EProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    // Product total price
                    EProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
