import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/screens/address/add_new_address.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        showBackArrow: true,
        title: Text(ETexts.addressScreenAppBarTitle, style: Theme.of(context).textTheme.headlineSmall),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /* ----------------------------------------------------------- */

              const ESingleAddress(selectedAddress: false), //!!!
              const ESingleAddress(selectedAddress: true), //!!!
              const ESingleAddress(selectedAddress: false), //!!!
              const ESingleAddress(selectedAddress: false), //!!!
              const ESingleAddress(selectedAddress: true), //!!!
              const ESingleAddress(selectedAddress: false), //!!!
              const ESingleAddress(selectedAddress: false), //!!!

              /* ----------------------------------------------------------- */

              SizedBox(height: EDeviceUtils.getBottomNavigationBarHeight()),

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
      /*                                BOTTOM                               */
      /* ------------------------------------------------------------------- */

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()), //?
        backgroundColor: EColors.primary,
        child: const Icon(Iconsax.add, color: EColors.white),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
