import 'package:e_commerce_app/utils/constants/text_strings.dart';

class ProductAttributeModel {
  /* ----------------------------------------------------------------------- */

  //! Keep those values "final" which you do not want to update
  String? name;
  final List<String>? values;

  /* ----------------------------------------------------------------------- */
  /*                                CONTRUCTOR                               */
  /* ----------------------------------------------------------------------- */

  ProductAttributeModel({
    this.name,
    this.values,
  });

  /* ----------------------------------------------------------------------- */
  /*                                 FACTORY                                 */
  /* ----------------------------------------------------------------------- */

  /// Map JSON oriented document snapshot from Firebase to [ProductAttributeModel].
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductAttributeModel();

    // Map JSON Record to the Model
    return ProductAttributeModel(
      name: data.containsKey(ETexts.productAttributeModelName) ? data[ETexts.productAttributeModelName] : '',
      values: List<String>.from(data[ETexts.productAttributeModelValues]),
    );
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Convert MODEL to JSON structure so that you can store data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      ETexts.productAttributeModelName: name,
      ETexts.productAttributeModelValues: values,
    };
  }

  /* ----------------------------------------------------------------------- */
}
