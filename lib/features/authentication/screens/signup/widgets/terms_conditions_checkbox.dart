import 'package:e_commerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ETermsAndConditionsCheckbox extends StatelessWidget {
  const ETermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance; //!
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          //! To view observable variable ... of [SignupController]
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value, //?
            ),
          ),
        ),
        const SizedBox(width: ESizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              /* ----------------------------------------------------------- */

              TextSpan(
                text: '${ETexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              //!!! Add link URL for Privacy Policy
              TextSpan(
                text: ETexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: isDark ? EColors.white : EColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: isDark ? EColors.white : EColors.primary,
                    ),
              ),

              TextSpan(
                text: ' ${ETexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              //!!! Add link URL for Terms of Use
              TextSpan(
                text: ETexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: isDark ? EColors.white : EColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: isDark ? EColors.white : EColors.primary,
                    ),
              ),

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ],
    );
  }
}
