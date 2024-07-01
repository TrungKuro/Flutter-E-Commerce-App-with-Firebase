import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Column(
      children: [
        /* ----------------------------------------------------------------- */

        /// Title
        ESectionHeading(
          title: ETexts.paymentMethodTitle,
          buttonTitle: ETexts.change,
          onPressed: () {}, //?
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),

        /// Detail
        Row(
          children: [
            ERoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: isDark ? EColors.light : EColors.white,
              child: const Image(
                image: AssetImage(EImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: ESizes.spaceBtwItems / 2),
            Text(
              ETexts.paypalPaymentMethodSubTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),

        /* ----------------------------------------------------------------- */
      ],
    );
  }
}
