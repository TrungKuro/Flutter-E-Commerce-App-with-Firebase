import 'package:e_commerce_app/utils/constants/text_strings.dart';

class ProductVariationModel {
  /* ----------------------------------------------------------------------- */

  //! Keep those values "final" which you do not want to update
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  /* ----------------------------------------------------------------------- */
  /*                                CONTRUCTOR                               */
  /* ----------------------------------------------------------------------- */

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /* ----------------------------------------------------------------------- */
  /*                                 FACTORY                                 */
  /* ----------------------------------------------------------------------- */

  /// Map JSON oriented document snapshot from Firebase to [ProductVariationModel].
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductVariationModel.empty();

    // Map JSON Record to the Model
    return ProductVariationModel(
      id: data[ETexts.productVariationModelID] ?? '',
      image: data[ETexts.productVariationModelImage] ?? '',
      sku: data[ETexts.productVariationModelSKU] ?? '',
      price: double.parse((data[ETexts.productVariationModelPrice] ?? 0.0).toString()),
      salePrice: double.parse((data[ETexts.productVariationModelSalePrice] ?? 0.0).toString()),
      stock: data[ETexts.productVariationModelStock] ?? 0,
      attributeValues: Map<String, String>.from(data[ETexts.productVariationModelAttributeValues]),
    );
  }

  /* ----------------------------------------------------------------------- */
  /*                             STATIC FUNCTION                             */
  /* ----------------------------------------------------------------------- */

  /// Static function to create an empty [ProductVariationModel].
  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributeValues: {},
      );

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Convert MODEL to JSON structure so that you can store data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      ETexts.productVariationModelID: id,
      ETexts.productVariationModelImage: image,
      ETexts.productVariationModelDescription: description,
      ETexts.productVariationModelPrice: price,
      ETexts.productVariationModelSalePrice: salePrice,
      ETexts.productVariationModelSKU: sku,
      ETexts.productVariationModelStock: stock,
      ETexts.productVariationModelAttributeValues: attributeValues,
    };
  }

  /* ----------------------------------------------------------------------- */
}
