import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/services/firebase_storage_service.dart';
import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  //! Sử dụng gói "cloud_firestore"
  final FirebaseFirestore _db = FirebaseFirestore.instance; //!

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Get all order related to current user.
  Future<List<BannerModel>> fetchBanners() async {
    try {
      /* ------------------------------------------------------------------- */

      final result = await _db.collection(ETexts.collectionPathBanners).where(ETexts.bannerModelActive, isEqualTo: true).get();

      //! For Debug
      if (kDebugMode) print('Get a list of all Banners on Firestore success.');

      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

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

  /// Upload banners to the Cloud Firebase.
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // Upload all the Banners along with their images
      final storage = Get.put(EFirebaseStorageService());

      // Loop through each banner
      for (var banner in banners) {
        // Get image data link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // Upload image and get its URL
        final url = await storage.uploadImageData(ETexts.collectionPathBanners, file, banner.imageUrl);

        // Assign URL to banner imageUrl attribute
        banner.imageUrl = url;

        // Store banner in Firestore
        await _db.collection(ETexts.collectionPathBanners).doc().set(banner.toJson());
      }

      //! For Debug
      if (kDebugMode) print('Upload a list of all Banners to Firestore success.');
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
