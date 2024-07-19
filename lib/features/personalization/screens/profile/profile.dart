import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance; //!

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: const EAppBar(
        showBackArrow: true,
        title: Text(ETexts.profileAppBarTitle),
      ),

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

                //! To view observable variable ... of [UserController]
                Obx(
                  () {
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty ? networkImage : EImages.user; //! For test UI
                    return controller.imageUploading.value
                        ? const EShimmerEffect(width: 80, height: 80, radius: 80)
                        : ECircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                  },
                ),
                TextButton(
                  onPressed: () => controller.uploadUserProfilePicture(), //?
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

                //! To view observable variable ... of [UserController]
                Obx(
                  () => EProfileMenu(
                    title: ETexts.nameTitle,
                    value: controller.fullNameUser.value, // ETexts.nameValue, //! For test UI
                    onPressed: () => Get.to(() => const ChangeNameScreen()), //?
                  ),
                ),
                EProfileMenu(
                  title: ETexts.userNameTitle,
                  value: controller.user.value.userName, // ETexts.userNameValue, //! For test UI
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
                  value: controller.user.value.id, // ETexts.userIDValue, //! For test UI
                  icon: Iconsax.copy,
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.emailTitle,
                  value: controller.user.value.email, // ETexts.emailValue, //! For test UI
                  icon: Iconsax.copy,
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.phoneNumberTitle,
                  value: controller.phoneNoUser.value, // ETexts.phoneNumberValue, //! For test UI
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.genderTitle,
                  value: ETexts.genderValue, //! For test UI
                  onPressed: () {}, //?
                ),
                EProfileMenu(
                  title: ETexts.dateOfBirthTitle,
                  value: ETexts.dateOfBirthValue, //! For test UI
                  onPressed: () {}, //?
                ),

                const SizedBox(height: ESizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: ESizes.spaceBtwItems),

                /// Button - Close Account
                Center(
                  child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(), //?
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
