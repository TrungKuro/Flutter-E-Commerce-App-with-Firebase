import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EProductQuantityWithAddRemoveButton extends StatelessWidget {
  const EProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /* ----------------------------------------------------------------- */

        /// Increase Button
        ECircularIcon(
          onPressed: remove, //?
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ESizes.md,
          color: isDark ? EColors.white : EColors.black,
          backgroundColor: isDark ? EColors.darkerGrey : EColors.light,
        ),

        /// Quantity purchased
        const SizedBox(width: ESizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ESizes.spaceBtwItems),

        /// Decrease Button
        ECircularIcon(
          onPressed: add, //?
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ESizes.md,
          color: EColors.white,
          backgroundColor: EColors.primary,
        ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
