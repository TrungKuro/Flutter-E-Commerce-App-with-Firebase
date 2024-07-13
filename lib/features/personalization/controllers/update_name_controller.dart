import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final userRepository = Get.put(UserRepository()); //!

  final userController = UserController.instance; //!

  //! Form key for Form Validation
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /* ----------------------------------------------------------------------- */
  /*                                 OVERRIDE                                */
  /* ----------------------------------------------------------------------- */

  /// Init user data when [Home Screen] appears.
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// FETCH user record.
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  /// UPDATE user record.
  Future<void> updateUserName() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(
        ETexts.waitUpdateDialog,
        EImages.loadingAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Show reason message
        ELoaders.warningSnackBar(
          title: ETexts.noInternetTitle,
          message: ETexts.noInternetMsg,
        );
        // Stop function
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Stop function
        return;
      }

      //! Update user's "First & Last name" in the Firebase Firestore
      Map<String, dynamic> name = {
        ETexts.userModelFirstName: firstName.text.trim(),
        ETexts.userModelLastName: lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      //! Update the Rx<UserModel> value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Show success message
      ELoaders.successSnackBar(
        title: ETexts.updateSuccessTitle,
        message: ETexts.updateNameSuccessTitle,
      );

      // Move to the previous screen [Profile Screen]
      Get.off(() => const ProfileScreen());

      /* ------------------------------------------------------------------- */
    } catch (e) {
      /* ------------------------------------------------------------------- */

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(
        title: ETexts.ohSnapTitle,
        message: e.toString(),
      );

      /* ------------------------------------------------------------------- */
    }
  }
}
