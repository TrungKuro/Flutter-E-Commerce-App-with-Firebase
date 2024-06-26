import 'package:e_commerce_app/common/styles/spacing_styles.dart';
import 'package:e_commerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce_app/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* ------------------------------------------------------------------------- */

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /* ----------------------------------------------------------- */

              /// Logo, Title & Sub-Title
              const ELoginHeader(),

              /// Form
              const ELoginForm(),

              /// Divider
              EFormDivider(dividerText: ETexts.orSignInWith.capitalize!),
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
