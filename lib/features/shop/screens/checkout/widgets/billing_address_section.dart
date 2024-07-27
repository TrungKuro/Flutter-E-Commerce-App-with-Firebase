import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class EBillingAddressSection extends StatelessWidget {
  const EBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* ----------------------------------------------------------------- */

        /// Title
        ESectionHeading(
          title: ETexts.shippingAddressTitle,
          buttonTitle: ETexts.change,
          onPressed: () => addressController.selectNewAddressPopup(context), //?
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),

        /// SubTitle
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Coding with T', style: Theme.of(context).textTheme.bodyLarge),

                  const SizedBox(height: ESizes.spaceBtwItems / 2),

                  /// Detail
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: ESizes.spaceBtwItems),
                      Text('+92-317-8059525', style: Theme.of(context).textTheme.bodyMedium), //!!!
                    ],
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_history,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: ESizes.spaceBtwItems),
                      Text(
                        'South Liana, Maine 87695, USA', //!!!
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      ),
                    ],
                  ),
                ],
              )
            : Text(
                'Select Address',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
