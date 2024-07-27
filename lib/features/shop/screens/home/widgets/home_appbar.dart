import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EHomeAppBar extends StatelessWidget {
  const EHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController()); //!

    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ETexts.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: EColors.grey),
          ),
          //! To view observable variable ... of [UserController]
          Obx(
            () {
              /* ------------------------------------------------------------- */

              if (controller.profileLoading.value) {
                // Display a shimmer loader while user profile is being loaded
                return const EShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.fullNameUser.value, //!!!
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white),
                );
              }

              /* ------------------------------------------------------------- */
            },
          ),
        ],
      ),
      actions: const [
        ECartCounterIcon(
          iconColor: EColors.white,
          counterBgColor: EColors.black,
          counterTextColor: EColors.white,
        )
      ],
    );
  }
}
