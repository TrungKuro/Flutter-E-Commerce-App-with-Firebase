import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EBillingAddressSection extends StatelessWidget {
  const EBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///
        ESectionHeading(
          title: 'Shipping Address', //!!!
          buttonTitle: 'Change', //!!!
          onPressed: () {}, //?
        ),
        Text(
          'Coding with T', //!!!
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey, //!!!
              size: 16,
            ),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text(
              '+92-317-8059525', //!!!
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey, //!!!
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
    );
  }
}
