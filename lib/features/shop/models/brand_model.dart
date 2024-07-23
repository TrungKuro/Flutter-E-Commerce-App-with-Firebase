import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';

class BrandModel {
  /* ----------------------------------------------------------------------- */

  //! Keep those values "final" which you do not want to update
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  /* ----------------------------------------------------------------------- */
  /*                                CONTRUCTOR                               */
  /* ----------------------------------------------------------------------- */

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  /* ----------------------------------------------------------------------- */
  /*                                 FACTORY                                 */
  /* ----------------------------------------------------------------------- */

  /// Map JSON oriented document snapshot from Firebase to [BrandModel].
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return BrandModel.empty();

    // Map JSON Record to the Model
    return BrandModel(
      id: data[ETexts.brandModelID] ?? '',
      image: data[ETexts.brandModelImage] ?? '',
      name: data[ETexts.brandModelName] ?? '',
      isFeatured: data[ETexts.brandModelIsFeatured] ?? false,
      productsCount: int.parse((data[ETexts.brandModelProductsCount] ?? 0).toString()),
    );
  }

  /// Map JSON oriented document snapshot from Firebase to [UserModel].
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '', //!!!
        image: data['Image'] ?? '', //!!!
        productsCount: data['ProductsCount'] ?? '', //!!!
        isFeatured: data['IsFeatured'] ?? false, //!!!
      );
    } else {
      return BrandModel.empty();
    }
  }

  /* ----------------------------------------------------------------------- */
  /*                             STATIC FUNCTION                             */
  /* ----------------------------------------------------------------------- */

  /// Static function to create an empty [BrandModel].
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Convert MODEL to JSON structure so that you can store data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      ETexts.brandModelID: id,
      ETexts.brandModelName: name,
      ETexts.brandModelImage: image,
      ETexts.brandModelProductsCount: productsCount,
      ETexts.brandModelIsFeatured: isFeatured,
    };
  }

  /* ----------------------------------------------------------------------- */
}
