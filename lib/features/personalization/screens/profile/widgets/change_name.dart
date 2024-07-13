import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController()); //!

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        showBackArrow: true,
        title: Text(ETexts.changeNameScreenAppBarTitle, style: Theme.of(context).textTheme.headlineSmall),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* ------------------------------------------------------------- */

            /// Headings
            Text(
              ETexts.changeNameScreenAppBarSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: ESizes.spaceBtwSections),

            /// Text Field
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  /* ------------------------------------------------------- */

                  /// First Name
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => EValidator.validateEmptyText(ETexts.firstName, value), //?
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: ETexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),

                  /// Spacer
                  const SizedBox(height: ESizes.spaceBtwInputFields),

                  /// Last Name
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => EValidator.validateEmptyText(ETexts.lastName, value), //?
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: ETexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),

                  /* ------------------------------------------------------- */
                ],
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(), //?
                child: const Text(ETexts.save),
              ),
            ),

            /* ------------------------------------------------------------- */
          ],
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
