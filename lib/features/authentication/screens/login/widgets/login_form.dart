import 'package:e_commerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ELoginForm extends StatelessWidget {
  const ELoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ESizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ETexts.email,
              ),
            ),
            // Spacer
            const SizedBox(height: ESizes.spaceBtwInputFields),
            // Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: ETexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            // Spacer
            const SizedBox(height: ESizes.spaceBtwInputFields / 2),
            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Checkbox(
                      value: true, onChanged: (value) {}, //?
                    ),
                    const Text(ETexts.rememberMe),
                  ],
                ),
                // Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()), //?
                  child: const Text(ETexts.forgetPassword),
                ),
              ],
            ),
            // Spacer
            const SizedBox(height: ESizes.spaceBtwSections),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()), //?
                child: const Text(ETexts.signIn),
              ),
            ),
            // Spacer
            const SizedBox(height: ESizes.spaceBtwItems),
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()), //?
                child: const Text(ETexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
