import 'package:e_commerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce_app/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: AppBar(),

      /* ------------------------------------------------------------------- */
      /*                                BOTTOM                               */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* ----------------------------------------------------------- */

              /// Title
              Text(
                ETexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Form
              const ESignUpForm(),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Divider
              EFormDivider(dividerText: ETexts.orSignUpWith.capitalize!),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Social Buttons
              const ESocialButtons(),

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
