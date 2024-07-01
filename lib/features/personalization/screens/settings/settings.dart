import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/screens/address/user_address.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:e_commerce_app/features/shop/screens/order/order.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            EPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  EAppBar(
                    title: Text(
                      ETexts.settingsAppBarTitle,
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: EColors.white),
                    ),
                  ),

                  /// User Profile Card
                  EUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()), //?
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                children: [
                  /* ------------------------------------------------------- */
                  /*                     Account Settings                    */
                  /* ------------------------------------------------------- */

                  const ESectionHeading(
                    title: ETexts.accountSettingsTitle,
                    showActionButton: false,
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),

                  /* ------------------------------------------------------- */

                  ESettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: ETexts.myAddressTitle,
                    subTitle: ETexts.myAddressSubTitle,
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const ESettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: ETexts.myCartTitle,
                    subTitle: ETexts.myCartSubTitle,
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: ETexts.myOrdersTitle,
                    subTitle: ETexts.myOrdersSubTitle,
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const ESettingsMenuTile(
                    icon: Iconsax.bank,
                    title: ETexts.bankAccountTitle,
                    subTitle: ETexts.bankAccountSubTitle,
                  ),
                  const ESettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: ETexts.myCouponsTitle,
                    subTitle: ETexts.myCouponsSubTitle,
                  ),
                  const ESettingsMenuTile(
                    icon: Iconsax.notification,
                    title: ETexts.notificationsTitle,
                    subTitle: ETexts.notificationsSubTitle,
                  ),
                  const ESettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: ETexts.accountPrivacyTitle,
                    subTitle: ETexts.accountPrivacySubTitle,
                  ),

                  /* ------------------------------------------------------- */

                  const SizedBox(height: ESizes.spaceBtwSections),

                  /* ------------------------------------------------------- */
                  /*                       App Settings                      */
                  /* ------------------------------------------------------- */

                  const ESectionHeading(
                    title: ETexts.appSettingsTitle,
                    showActionButton: false,
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),

                  /* ------------------------------------------------------- */

                  const ESettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: ETexts.loadDataTitle,
                    subTitle: ETexts.loadDataSubTitle,
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.location,
                    title: ETexts.geolocationTitle,
                    subTitle: ETexts.geolocationSubTitle,
                    trailing: Switch(
                      value: true, onChanged: (value) {}, //?
                    ),
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: ETexts.safeModeTitle,
                    subTitle: ETexts.safeModeSubTitle,
                    trailing: Switch(
                      value: true, onChanged: (value) {}, //?
                    ),
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.image,
                    title: ETexts.imageQualityTitle,
                    subTitle: ETexts.imageQualitySubTitle,
                    trailing: Switch(
                      value: true, onChanged: (value) {}, //?
                    ),
                  ),

                  /* ------------------------------------------------------- */
                  /*                      Logout Button                      */
                  /* ------------------------------------------------------- */

                  const SizedBox(height: ESizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {}, //?
                      child: const Text(ETexts.logout),
                    ),
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /* ------------------------------------------------------- */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
