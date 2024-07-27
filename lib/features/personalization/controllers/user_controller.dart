import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/personalization/models/user_model.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find(); //!
  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  final userRepository = Get.put(UserRepository()); //!

  //! Observable
  final profileLoading = false.obs;

  //! Observable for hiding/showing password
  final hidePassword = true.obs;

  //! Observable
  final Rx<UserModel> user = UserModel.empty().obs;

  //! Observable value from formats of [UserModel]
  final fullNameUser = ''.obs;
  final phoneNoUser = ''.obs;

  //! Observable
  final imageUploading = false.obs;

  //! Form key for Form Validation
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  /* ----------------------------------------------------------------------- */
  /*                                 OVERRIDE                                */
  /* ----------------------------------------------------------------------- */

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// --- FETCH user record
  Future<void> fetchUserRecord() async {
    try {
      /* ------------------------------------------------------------------- */

      profileLoading.value = true;

      //! Load information from the user account to the UI
      final user = await userRepository.fetchUserDetails();
      this.user(user);

      //! And some separately formatted data
      fullNameUser.value = this.user.value.formattedFullName;
      phoneNoUser.value = this.user.value.formattedPhoneNo;

      /* ------------------------------------------------------------------- */
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// --- SAVE user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      /* ------------------------------------------------------------------- */

      //! First update Rx<UserModel> and then check if user data is already stored. If not store new data.
      await fetchUserRecord();

      // If no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert info "Name" from Google account to "FirstName" and "LastName" for Firestore
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          // Convert info "Name" from Google account to "UserName" for Firestore
          final userName = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          //! Create user information according to UserModel
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: userName,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //! Save Authenticated user data in the Firebase Firestore
          await userRepository.saveUserRecord(user);
        }
      }

      /* ------------------------------------------------------------------- */
    } catch (e) {
      ELoaders.warningSnackBar(
        title: ETexts.saveUserRecordTitle,
        message: ETexts.saveUserRecordMsg,
      );
    }
  }

  /// --- DELETE user account
  Future<void> deleteUserAccount() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(
        ETexts.waitResponsesDialog,
        EImages.loadingAnimation,
      );

      //! First Re-Authenticate User
      final auth = AuthenticationRepository.instance; //!
      final provider = auth.authUser.providerData.map((e) => e.providerId).first;

      //! Re-Verify Auth Email
      if (provider.isNotEmpty) {
        switch (provider) {
          /* --------------------------------------------------------------- */

          case ETexts.providerEmailAndPass:
            // Stop Loading
            EFullScreenLoader.stopLoading();
            // Move to [ReAuthLoginForm Screen]
            Get.off(() => const ReAuthLoginFormScreen());

          /* --------------------------------------------------------------- */

          case ETexts.providerGoogle:
            await auth.signInWithGoogle();
            await auth.deleteAccount();
            // Stop Loading
            EFullScreenLoader.stopLoading();
            // Move to [Login Screen]
            Get.offAll(() => const LoginScreen());

          /* --------------------------------------------------------------- */

          case ETexts.providerFacebook: //!!!

          /* --------------------------------------------------------------- */

          case ETexts.providerApple: //!!!

          /* --------------------------------------------------------------- */
        }
      }

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

  /// --- RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      /* ------------------------------------------------------------------- */

      // Start Loading
      EFullScreenLoader.openLoadingDialog(
        ETexts.waitResponsesDialog,
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
      if (!reAuthFormKey.currentState!.validate()) {
        // Stop Loading
        EFullScreenLoader.stopLoading();
        // Stop function
        return;
      }

      //! Wait for confirmation from the user to delete the account
      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );

      //! Delete the account when the authenticated user agrees
      await AuthenticationRepository.instance.deleteAccount();

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Move to [Login Screen]
      Get.offAll(() => const LoginScreen());

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

  /// --- UPLOAD profile image
  Future<void> uploadUserProfilePicture() async {
    try {
      /* ------------------------------------------------------------------- */

      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70, //!!!
        maxHeight: 512, //!!!
        maxWidth: 512, //!!!
      );

      if (image != null) {
        imageUploading.value = true;

        //! Upload image
        final imageUrl = await userRepository.uploadImage(
          ETexts.storagePathUsersImagesProfile,
          image,
        );

        //! Upload user image record
        Map<String, dynamic> json = {ETexts.userModelProfilePicture: imageUrl};
        await userRepository.updateSingleField(json);

        //! Makes a direct update image
        user.value.profilePicture = imageUrl;
        user.refresh(); //!

        ELoaders.successSnackBar(
          title: ETexts.updateSuccessTitle,
          message: ETexts.updateProfileImageSuccessTitle,
        );
      }

      /* ------------------------------------------------------------------- */
    } catch (e) {
      ELoaders.errorSnackBar(
        title: ETexts.ohSnapTitle,
        message: e.toString(),
      );
    } finally {
      imageUploading.value = false;
    }
  }

  /* ----------------------------------------------------------------------- */

  /// --- WARNING about account deletion
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ESizes.md),
      title: ETexts.deleteAccountTitle,
      middleText: ETexts.deleteAccountMsg,
      /* ------------------------------------------------------------------- */
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(), //?
        style: ElevatedButton.styleFrom(
          backgroundColor: EColors.dangerous,
          side: const BorderSide(color: EColors.dangerous),
          padding: const EdgeInsets.symmetric(vertical: ESizes.sm, horizontal: ESizes.md),
        ),
        child: const Text(ETexts.delete),
      ),
      /* ------------------------------------------------------------------- */
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(), //?
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: ESizes.sm, horizontal: ESizes.md),
        ),
        child: const Text(ETexts.cancel),
      ),
      /* ------------------------------------------------------------------- */
    );
  }

  /* ----------------------------------------------------------------------- */
}
