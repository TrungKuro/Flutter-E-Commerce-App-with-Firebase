import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EBottomAddToCart extends StatelessWidget {
  const EBottomAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Container(
      padding: EdgeInsets.only(
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        top: ESizes.defaultSpace,
        bottom: EDeviceUtils.getBottomNavigationBarHeight() * 0.7,
      ),
      decoration: BoxDecoration(
        color: isDark ? EColors.darkerGrey : EColors.grey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ESizes.cardRadiusLg),
          topRight: Radius.circular(ESizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ECircularIcon(
                  onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1, //?
                  icon: Iconsax.minus,
                  backgroundColor: EColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: EColors.white,
                ),
                const SizedBox(width: ESizes.spaceBtwItems),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: ESizes.spaceBtwItems),
                ECircularIcon(
                  onPressed: () => controller.productQuantityInCart.value += 1,
                  icon: Iconsax.add,
                  backgroundColor: EColors.black,
                  width: 40,
                  height: 40,
                  color: EColors.white,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product), //?
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(ESizes.md),
                backgroundColor: EColors.black,
                side: const BorderSide(color: EColors.black),
              ),
              child: const Text(ETexts.addToCart),
            ),
          ],
        ),
      ),
    );
  }
}
