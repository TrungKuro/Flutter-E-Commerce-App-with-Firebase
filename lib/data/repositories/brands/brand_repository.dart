import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/services/firebase_storage_service.dart';
import 'package:e_commerce_app/features/shop/models/brand_category_model.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// --- GET all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get(); //!!!
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
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

  /// --- GET brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all document where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Collection
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
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

  /// Upload brands to the Cloud Firebase
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      // Upload all the Brands along with their images
      final storage = Get.put(EFirebaseStorageService());

      // Loop through each brand
      for (var brand in brands) {
        // Get image data link from the local assets
        final file = await storage.getImageDataFromAssets(brand.image);

        // Upload image and get its URL
        final url = await storage.uploadImageData('Brands', file, brand.name);

        // Assign URL to brand image attribute
        brand.image = url;

        // Store brand in Firestore
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
      }

      //! For Debug
      if (kDebugMode) print('Upload a list of all Brands to Firestore success.');
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }

  /// Upload brand categories to the Cloud Firebase
  Future<void> uploadBrandCategory(List<BrandCategoryModel> brandCategories) async {
    try {
      // Upload all the brand categories
      for (var brandCategory in brandCategories) {
        await _db.collection('BrandCategory').doc().set(brandCategory.toJson());
      }

      //! For Debug
      if (kDebugMode) print('Upload a list of all BrandCategories to Firestore success.');
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw ETexts.throwError;
    }
  }
}
