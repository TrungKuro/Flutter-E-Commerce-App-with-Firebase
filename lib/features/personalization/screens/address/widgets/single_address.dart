import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ESingleAddress extends StatelessWidget {
  const ESingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return ERoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(ESizes.md),
      width: double.infinity,
      backgroundColor: selectedAddress ? EColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? EColors.darkerGrey
              : EColors.grey,
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Name & Tick
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name User
              Text(
                'John Doe', //!!!
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              /// Tick Select
              Icon(
                selectedAddress ? Icons.check_circle_rounded : null,
                color: selectedAddress
                    ? isDark
                        ? EColors.light
                        : EColors.dark
                    : null,
              ),
            ],
          ),
          const SizedBox(height: ESizes.sm / 2),

          /// Number Phone
          const Text(
            '(+123) 456 7890', //!!!
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: ESizes.sm / 2),

          /// Detail Address
          const Text(
            '82356 Timmy Caves, South Liana, Maine, 87665, USA', //!!!
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
