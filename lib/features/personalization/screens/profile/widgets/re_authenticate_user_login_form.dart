import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginFormScreen extends StatelessWidget {
  const ReAuthLoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance; //!

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: AppBar(title: const Text(ETexts.reauthLoginFormScreenAppBarTitle)),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* --------------------------------------------------------- */

                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => EValidator.validateEmail(value), //?
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: ETexts.email,
                  ),
                ),
                const SizedBox(height: ESizes.spaceBtwInputFields),

                /// Password
                //! To view observable variable ... of [UserController]
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    obscureText: controller.hidePassword.value,
                    validator: (value) => EValidator.validatePassword(value), //?
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: ETexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, //?
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: ESizes.spaceBtwInputFields),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), //?
                    child: const Text(ETexts.verify),
                  ),
                ),

                /* --------------------------------------------------------- */
              ],
            ),
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
