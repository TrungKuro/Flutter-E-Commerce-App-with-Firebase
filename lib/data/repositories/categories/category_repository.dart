import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/services/firebase_storage_service.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  //! Sử dụng gói "cloud_firestore"
  final FirebaseFirestore _db = FirebaseFirestore.instance; //!

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Get all categories.
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      /* ------------------------------------------------------------------- */

      final snapshot = await _db.collection(ETexts.collectionPathCategories).get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();

      //! For Debug
      if (kDebugMode) print('Get a list of all Categories on Firestore success.');

      return list;

      /* ------------------------------------------------------------------- */
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// Get sub categories.
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// Upload categories to the Could Firebase.
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      /* ------------------------------------------------------------------- */

      // Upload all the Categories along with their images
      final storage = Get.put(EFirebaseStorageService()); //!

      // Loop through each category
      for (var category in categories) {
        // Get image data link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload image and get its URL
        final url = await storage.uploadImageData(ETexts.collectionPathCategories, file, category.name);

        // Assign URL to category image attribute
        category.image = url;

        // Store category in Firestore
        await _db.collection(ETexts.collectionPathCategories).doc(category.id).set(category.toJson());
      }

      //! For Debug
      if (kDebugMode) print('Upload a list of all Categories to Firestore success.');

      /* ------------------------------------------------------------------- */
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /* ----------------------------------------------------------------------- */
}
