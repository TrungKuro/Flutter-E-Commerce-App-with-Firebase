import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/features/personalization/models/address_model.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ESingleAddress extends StatelessWidget {
  const ESingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap, //?
        child: ERoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(ESizes.md),
          width: double.infinity,
          backgroundColor: selectedAddress ? EColors.primary.withValues(alpha: 0.5) : Colors.transparent,
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
                    address.name,
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
              Text(
                address.formattedPhoneNo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: ESizes.sm / 2),

              /// Detail Address
              Text(
                address.toString(),
                softWrap: true,
              ),
            ],
          ),
        ),
      );
    });
  }
}
