import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: const EAppBar(
        showBackArrow: true,
        title: Text(ETexts.addNewAddressScreenAppBarTitle),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey, //!
            child: Column(
              children: [
                /* --------------------------------------------------------- */

                /// Name User
                TextFormField(
                  controller: controller.name,
                  validator: (value) => EValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: ETexts.nameTitle,
                  ),
                ),
                const SizedBox(height: ESizes.spaceBtwInputFields),

                /// Phone Number
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: EValidator.validatePhoneNumber,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: ETexts.phoneNumberTitle,
                  ),
                ),
                const SizedBox(height: ESizes.spaceBtwInputFields),

                /// Street & Postal Code
                Row(
                  children: [
                    /// Street
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => EValidator.validateEmptyText('Street', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: ETexts.streetTitle,
                        ),
                      ),
                    ),

                    const SizedBox(width: ESizes.spaceBtwInputFields),

                    // Postal Code
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => EValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: ETexts.postalCodeTitle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwInputFields),

                /// City & State
                Row(
                  children: [
                    /// City
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => EValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: ETexts.cityTitle,
                        ),
                      ),
                    ),

                    const SizedBox(width: ESizes.spaceBtwInputFields),

                    /// State
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => EValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: ETexts.stateTitle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwInputFields),

                /// Country
                TextFormField(
                  controller: controller.country,
                  validator: (value) => EValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: ETexts.countryTitle,
                  ),
                ),
                const SizedBox(height: ESizes.defaultSpace),

                /* --------------------------------------------------------- */

                /// Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {}, //?
                    child: const Text(ETexts.save),
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
