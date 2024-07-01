import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: const EAppBar(showBackArrow: true, title: Text(ETexts.profileAppBarTitle)),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                /* --------------------------------------------------------- */
                /*                      Profile Picture                      */
                /* --------------------------------------------------------- */

                const ECircularImage(
                  image: EImages.user, //!!!
                  width: 80,
                  height: 80,
                ),
                TextButton(
                  onPressed: () {}, //?
                  child: const Text(ETexts.profileAppBarSubTitle),
                ),

                /* --------------------------------------------------------- */
                /*                          Details                          */
                /* --------------------------------------------------------- */

                const Divider(),
                const SizedBox(height: ESizes.spaceBtwItems),

                /// Heading Profile Info
                const ESectionHeading(title: ETexts.profileInformationTitle, showActionButton: false),
                const SizedBox(height: ESizes.spaceBtwItems),

                EProfileMenu(
                  title: ETexts.nameTitle,
                  value: ETexts.nameValue, //!!!
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.userNameTitle,
                  value: ETexts.userNameValue, //!!!
                  onPressed: () {}, //?
                ),

                const SizedBox(height: ESizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: ESizes.spaceBtwItems),

                /// Heading Personal Info
                const ESectionHeading(title: ETexts.personalInformationTitle, showActionButton: false),
                const SizedBox(height: ESizes.spaceBtwItems),

                EProfileMenu(
                  title: ETexts.userIDTitle,
                  value: ETexts.userIDValue, //!!!
                  icon: Iconsax.copy,
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.emailTitle,
                  value: ETexts.emailValue, //!!!
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.phoneNumberTitle,
                  value: ETexts.phoneNumberValue, //!!!
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.genderTitle,
                  value: ETexts.genderValue, //!!!
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.dateOfBirthTitle,
                  value: ETexts.dateOfBirthValue, //!!!
                  onPressed: () {}, //?
                ),

                const SizedBox(height: ESizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: ESizes.spaceBtwItems),

                /// Button - Close Account
                Center(
                  child: TextButton(
                    onPressed: () {}, //?
                    child: const Text(
                      ETexts.closeAccount,
                      style: TextStyle(color: EColors.textRed),
                    ),
                  ),
                ),

                /* --------------------------------------------------------- */

                SizedBox(height: EDeviceUtils.getBottomNavigationBarHeight()),

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
