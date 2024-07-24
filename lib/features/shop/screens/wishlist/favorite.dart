import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/product/favorites_controller.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesController.instance;

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        title: Text(
          ETexts.wishListAppBarTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          ECircularIcon(
            icon: Iconsax.add,
            isTransparent: true,
            onPressed: () => Get.to(const HomeScreen()), //?
          )
        ],
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    // Nothing found widget
                    final emptyWidget = EAnimationLoader(
                      text: 'Whoops! Wishlist is Empty...',
                      animation: EImages.pencilAnimation,
                      showAction: true,
                      actionText: "Let's add some",
                      onActionPressed: () => Get.off(() => const NavigationMenu()),
                    );

                    const loader = EVerticalProductShimmer(itemCount: ENumberConstants.wishlistNumber);
                    final widget = ECloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget,
                    );
                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return EGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => EProductCardVertical(product: products[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
