import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EOrderListItems extends StatelessWidget {
  const EOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return ListView.separated(
      padding: EdgeInsets.only(
        top: ESizes.defaultSpace,
        left: ESizes.defaultSpace,
        right: ESizes.defaultSpace,
        bottom: ESizes.defaultSpace + EDeviceUtils.getBottomNavigationBarHeight(),
      ),
      shrinkWrap: true,
      itemCount: ENumberConstants.userOrdersNumber,
      //? Dấu (__) nghĩa là gì, nó khác gì với dấu (_)
      separatorBuilder: (_, __) => const SizedBox(height: ESizes.spaceBtwItems),
      itemBuilder: (_, index) => ERoundedContainer(
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
                        ETexts.statusOrderTitle,
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: EColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineSmall), //!!!
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
                            Text(ETexts.orderTitle, style: Theme.of(context).textTheme.labelMedium), //!!!
                            Text('[#256F2]', style: Theme.of(context).textTheme.titleMedium), //!!!
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
                            Text(ETexts.shippingDateTitle, style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb 2025', style: Theme.of(context).textTheme.titleMedium), //!!!
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
      ),
    );
  }
}
