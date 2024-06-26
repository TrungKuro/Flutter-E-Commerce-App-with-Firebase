import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ERattingAndShare extends StatelessWidget {
  const ERattingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: EColors.rating, size: 24),
            const SizedBox(width: ESizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0', //!!!
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TextSpan(
                    text: ' ',
                  ),
                  const TextSpan(
                    text: '(199)', //!!!
                  ),
                ],
              ),
            ),
          ],
        ),

        /// Share Button
        IconButton(
          onPressed: () {}, //?
          icon: const Icon(
            Icons.share,
            size: ESizes.iconMd,
          ),
        ),
      ],
    );
  }
}
