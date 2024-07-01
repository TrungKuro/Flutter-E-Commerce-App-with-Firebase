import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EBillingSection extends StatelessWidget {
  const EBillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return ERoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(ESizes.md),
      backgroundColor: isDark ? EColors.black : EColors.white,
      child: const Column(
        children: [
          /* --------------------------------------------------------------- */

          /// Pricing
          EBillingAmountSection(),
          SizedBox(height: ESizes.spaceBtwItems),

          /// Divider
          Divider(),
          SizedBox(height: ESizes.spaceBtwItems),

          /// Payment Methods
          EBillingPaymentSection(),
          SizedBox(height: ESizes.spaceBtwItems),

          /// Address
          EBillingAddressSection(),

          /* --------------------------------------------------------------- */
        ],
      ),
    );
  }
}
