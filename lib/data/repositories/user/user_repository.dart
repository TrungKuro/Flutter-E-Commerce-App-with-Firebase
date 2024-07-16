import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/personalization/models/user_model.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  //! Sử dụng gói "cloud_firestore"
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Function to SAVE user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      /* ------------------------------------------------------------------- */

      await _db.collection(ETexts.collectionPathUsers).doc(user.id).set(user.toJson());

      //! For Debug
      if (kDebugMode) print('Save info user into Firestore success.');

      /* ------------------------------------------------------------------- */
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// Function to FETCH user details based on user ID.
  Future<UserModel> fetchUserDetails() async {
    try {
      /* ------------------------------------------------------------------- */

      final documentSnapshot =
          await _db.collection(ETexts.collectionPathUsers).doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        //! For Debug
        if (kDebugMode) print('Document exists.');
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        //! For Debug
        if (kDebugMode) print('Document empty.');
        return UserModel.empty();
      }

      /* ------------------------------------------------------------------- */
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// Function to UPDATE user data in Firestore.
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      /* ------------------------------------------------------------------- */

      await _db.collection(ETexts.collectionPathUsers).doc(updateUser.id).update(updateUser.toJson());

      //! For Debug
      if (kDebugMode) print('Update data user into Firestore success.');

      /* ------------------------------------------------------------------- */
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// Function to UPDATE any field in specific [Users Collection].
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      /* ------------------------------------------------------------------- */

      await _db
          .collection(ETexts.collectionPathUsers)
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);

      //! For Debug
      if (kDebugMode) print('Update single data user into Firestore success.');

      /* ------------------------------------------------------------------- */
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// Function to REMOVE user data from Firestore.
  Future<void> removeUserRecord(String userID) async {
    try {
      /* ------------------------------------------------------------------- */

      await _db.collection(ETexts.collectionPathUsers).doc(userID).delete();

      //! For Debug
      if (kDebugMode) print('Delete info user out Firestore success.');

      /* ------------------------------------------------------------------- */
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// Function to UPLOAD any Image.
  Future<String> uploadImage(String path, XFile image) async {
    try {
      /* ------------------------------------------------------------------- */

      //! Upload a [File] from the filesystem then fetches a download URL for this object
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();

      //! For Debug
      if (kDebugMode) print('Upload Image into FirebaseStorage and get URL Image success.');

      return url;

      /* ------------------------------------------------------------------- */
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /* ----------------------------------------------------------------------- */
}
