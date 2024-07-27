import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/shop/controllers/product/order_controller.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EOrderListItems extends StatelessWidget {
  const EOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!
    final controller = Get.put(OrderController());

    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        // nothing found widget
        final emptyWidget = EAnimationLoader(
          text: 'Whoops! No orders yet!',
          animation: EImages.orderCompletedAnimation,
          showAction: true,
          actionText: "Let's fill it",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        // handle loader - no record - or error message
        final response = ECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        // Congratualtion record found
        final orders = snapshot.data!;
        return ListView.separated(
          padding: EdgeInsets.only(
            top: ESizes.defaultSpace,
            left: ESizes.defaultSpace,
            right: ESizes.defaultSpace,
            bottom: ESizes.defaultSpace + EDeviceUtils.getBottomNavigationBarHeight(),
          ),
          shrinkWrap: true,
          itemCount: orders.length,
          //? Dấu (__) nghĩa là gì, nó khác gì với dấu (_)
          separatorBuilder: (_, __) => const SizedBox(height: ESizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];
            return ERoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(ESizes.md),
              backgroundColor: isDark ? EColors.dark : EColors.light,
              child: Column(
                children: [
                  /* --------------------------------------------------------------- */

                  Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: ESizes.spaceBtwItems / 2),

                      /// Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge!.apply(
                                    color: EColors.primary,
                                    fontWeightDelta: 1,
                                  ),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),

                      /// Button
                      IconButton(
                        onPressed: () {}, //?
                        icon: const Icon(Iconsax.arrow_right_34, size: ESizes.iconSm),
                      ),
                    ],
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  Row(
                    children: [
                      /* ------------------------------------------------------- */

                      /// Order
                      Expanded(
                        child: Row(
                          children: [
                            /// Icon
                            const Icon(Iconsax.tag),
                            const SizedBox(width: ESizes.spaceBtwItems / 2),

                            /// Info
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ETexts.orderTitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.id,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Shipping Date
                      Expanded(
                        child: Row(
                          children: [
                            /// Icon
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: ESizes.spaceBtwItems / 2),

                            /// Info
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ETexts.shippingDateTitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /* ------------------------------------------------------- */
                    ],
                  ),

                  /* --------------------------------------------------------------- */
                ],
              ),
            );
          },
        );
      },
    );
  }
}
