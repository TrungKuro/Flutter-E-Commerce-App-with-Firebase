import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/models/user_model.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find(); //!
  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  final userRepository = Get.put(UserRepository()); //!

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      /* ------------------------------------------------------------------- */

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

      /* ------------------------------------------------------------------- */
    } catch (e) {
      ELoaders.warningSnackBar(
        title: ETexts.saveUserRecordTitle,
        message: ETexts.saveUserRecordMsg,
      );
    }
  }

  /* ----------------------------------------------------------------------- */
}
