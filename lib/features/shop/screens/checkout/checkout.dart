import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/cart/coupon_code.dart';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        showBackArrow: true,
        title: Text(ETexts.checkoutScreenAppBarTitle, style: Theme.of(context).textTheme.headlineSmall),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              // const ECartItems(showAddRemoveButtons: false),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Coupon TextField
              const ECouponCode(),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Billing Section
              ERoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ESizes.md),
                backgroundColor: isDark ? EColors.black : EColors.white,
                child: const Column(
                  children: [
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
      /*                                BOTTOM                               */
      /* ------------------------------------------------------------------- */

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: EImages.successfulPaymentIcon,
                title: 'Payment Success!', //!!!
                subTitle: 'Your item will be shipped soon!', //!!!
                onPressed: () => Get.offAll(() => const NavigationMenu()), //?
              )), //?
          child: const Text('Checkout \$256.0'), //!!!
        ),
      ),
    );
  }
}
