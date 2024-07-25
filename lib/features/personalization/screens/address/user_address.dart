import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/address/add_new_address.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

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
          child: Obx(
            () => FutureBuilder(
              //! Use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {
                // Handle loader, no record, or errors message
                final response = ECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;

                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_, index) => ESingleAddress(
                    address: addresses[index],
                    onTap: () => controller.selectAddress(addresses[index]), //?
                  ),
                );
                // SizedBox(height: EDeviceUtils.getBottomNavigationBarHeight()),
              },
            ),
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
