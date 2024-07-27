import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EAddToCartButton extends StatelessWidget {
  const EAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return InkWell(
      onTap: () {
        // If the product have variations then show the product Details for variation selection.
        // Else add product to the cart.
        if (product.productType == ProductType.single.toString()) {
          final cartItems = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItems);
        } else {
          Get.to(() => ProductDetailsScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? EColors.primary : EColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(ESizes.cardRadiusMd),
              bottomRight: Radius.circular(ESizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: ESizes.iconLg * 1.2,
            height: ESizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: EColors.white),
                    )
                  : const Icon(
                      Iconsax.add,
                      color: EColors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
