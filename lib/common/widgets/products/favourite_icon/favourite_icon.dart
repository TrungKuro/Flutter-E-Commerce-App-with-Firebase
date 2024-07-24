import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/features/shop/controllers/product/favorites_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EFavouriteIcon extends StatelessWidget {
  const EFavouriteIcon({
    super.key,
    this.isAppBar = false,
    required this.productId,
  });

  final bool isAppBar;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController()); //!

    return Obx(
      () => ECircularIcon(
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavorite(productId) ? EColors.favourite : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
        height: isAppBar ? EDeviceUtils.getAppBarHeight() : null,
        width: isAppBar ? EDeviceUtils.getAppBarHeight() : null,
      ),
    );
  }
}
