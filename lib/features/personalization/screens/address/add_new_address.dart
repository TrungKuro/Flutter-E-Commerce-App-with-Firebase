import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        showBackArrow: true,
        title: Text(ETexts.addNewAddressScreenAppBarTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                /// Name User
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: ETexts.nameTitle,
                  ),
                ),
                const SizedBox(height: ESizes.spaceBtwInputFields),

                /// Phone Number
                TextFormField(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
