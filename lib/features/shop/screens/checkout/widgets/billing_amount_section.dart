import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class EBillingAmountSection extends StatelessWidget {
  const EBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        /* ----------------------------------------------------------------- */

        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ETexts.subtotal, style: Theme.of(context).textTheme.bodyMedium),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ETexts.shippingFee, style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '\$${EPricingCalculator.calculateShippingCost(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ETexts.taxFee, style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '\$${EPricingCalculator.calculateTax(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ETexts.orderTotal, style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '\$${EPricingCalculator.calculateTotalPrice(subTotal, 'US')}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
