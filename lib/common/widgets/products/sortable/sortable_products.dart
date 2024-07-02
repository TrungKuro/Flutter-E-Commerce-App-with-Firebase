import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> productFilter = [
      'Name',
      'Higher Price',
      'Lower Price',
      'Sale',
      'Newest',
      'Popularity',
    ]; //!

    return Column(
      children: [
        /* ----------------------------------------------------------------- */

        /// Dropdown
        DropdownButtonFormField(
          onChanged: (value) {}, //?
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: productFilter.map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
        ),
        const SizedBox(height: ESizes.spaceBtwSections),

        /// Products
        EGridLayout(
          itemCount: ENumberConstants.popularProductNumber,
          itemBuilder: (_, index) => const EProductCardVertical(),
        ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
