import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce_app/features/shop/models/product_variation_model.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';

class ProductModel {
  /* ----------------------------------------------------------------------- */

  //! Keep those values "final" which you do not want to update
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  /* ----------------------------------------------------------------------- */
  /*                                CONTRUCTOR                               */
  /* ----------------------------------------------------------------------- */

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  /* ----------------------------------------------------------------------- */
  /*                                 FACTORY                                 */
  /* ----------------------------------------------------------------------- */

  /// Map JSON oriented document snapshot from Firebase to [ProductModel].
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;

    // Map JSON Record to the Model
    return ProductModel(
      id: document.id,
      sku: data[ETexts.productModelSKU],
      title: data[ETexts.productModelTitle],
      stock: data[ETexts.productModelStock] ?? 0,
      isFeatured: data[ETexts.productModelIsFeatured] ?? false,
      price: double.parse((data[ETexts.productModelPrice] ?? 0.0).toString()),
      salePrice: double.parse((data[ETexts.productModelSalePrice] ?? 0.0).toString()),
      thumbnail: data[ETexts.productModelThumbnail] ?? '',
      categoryId: data[ETexts.productModelCategoryID] ?? '',
      description: data[ETexts.productModelDescription] ?? '',
      productType: data[ETexts.productModelProductType] ?? '',
      brand: BrandModel.fromJson(data[ETexts.productModelBrand]),
      images: data[ETexts.productModelImages] != null ? List<String>.from(data[ETexts.productModelImages]) : [],
      productAttributes: (data[ETexts.productModelProductAttributes] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data[ETexts.productModelProductVariations] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }

  /// Map JSON-Oriented document snapshot from Firebase to Model
  // factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
  //   final data = document.data() as Map<String, dynamic>;

  //   return ProductModel(
  //     id: document.id,
  //     sku: data[ETexts.productModelSKU] ?? '',
  //     title: data[ETexts.productModelTitle] ?? '',
  //     stock: data[ETexts.productModelStock] ?? 0,
  //     isFeatured: data[ETexts.productModelIsFeatured] ?? false,

  //     //!!!!!
  //   );
  // }

  /* ----------------------------------------------------------------------- */
  /*                             STATIC FUNCTION                             */
  /* ----------------------------------------------------------------------- */

  /// Static function to create an empty [ProductModel].
  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0.0,
        thumbnail: '',
        productType: '',
      );

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Convert MODEL to JSON structure so that you can store data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      ETexts.productModelSKU: sku,
      ETexts.productModelTitle: title,
      ETexts.productModelStock: stock,
      ETexts.productModelPrice: price,
      ETexts.productModelSalePrice: salePrice,
      ETexts.productModelImages: images ?? [],
      ETexts.productModelThumbnail: thumbnail,
      ETexts.productModelIsFeatured: isFeatured,
      ETexts.productModelCategoryID: categoryId,
      ETexts.productModelBrand: brand!.toJson(),
      ETexts.productModelDescription: description,
      ETexts.productModelProductType: productType,
      ETexts.productModelProductAttributes: productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      ETexts.productModelProductVariations: productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  /* ----------------------------------------------------------------------- */
}
