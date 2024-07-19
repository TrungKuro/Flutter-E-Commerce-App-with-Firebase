import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';

class CategoryModel {
  /* ----------------------------------------------------------------------- */

  //! Keep those values "final" which you do not want to update
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  /* ----------------------------------------------------------------------- */
  /*                                CONTRUCTOR                               */
  /* ----------------------------------------------------------------------- */

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  /* ----------------------------------------------------------------------- */
  /*                                 FACTORY                                 */
  /* ----------------------------------------------------------------------- */

  /// Map JSON oriented document snapshot from Firebase to [CategoryModel].
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return CategoryModel(
        id: document.id,
        name: data[ETexts.categoryModelName] ?? '',
        image: data[ETexts.categoryModelImage] ?? '',
        parentId: data[ETexts.categoryModelParentID] ?? '',
        isFeatured: data[ETexts.categoryModelIsFeatured] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }

  /* ----------------------------------------------------------------------- */
  /*                             STATIC FUNCTION                             */
  /* ----------------------------------------------------------------------- */

  /// Static function to create an empty [CategoryModel].
  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        isFeatured: false,
      );

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Convert MODEL to JSON structure so that you can store data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      ETexts.categoryModelName: name,
      ETexts.categoryModelImage: image,
      ETexts.categoryModelParentID: parentId,
      ETexts.categoryModelIsFeatured: isFeatured,
    };
  }

  /* ----------------------------------------------------------------------- */
}
