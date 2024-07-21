import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';

class BannerModel {
  /* ----------------------------------------------------------------------- */

  //! Keep those values "final" which you do not want to update
  String imageUrl;
  final String targetScreen;
  final bool active;

  /* ----------------------------------------------------------------------- */
  /*                                CONTRUCTOR                               */
  /* ----------------------------------------------------------------------- */

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  /* ----------------------------------------------------------------------- */
  /*                                 FACTORY                                 */
  /* ----------------------------------------------------------------------- */

  /// Map JSON oriented document snapshot from Firebase to [BannerModel].
  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    // Map JSON Record to the Model
    return BannerModel(
      imageUrl: data[ETexts.bannerModelImageUrl] ?? '',
      targetScreen: data[ETexts.bannerModelTargetScreen] ?? '',
      active: data[ETexts.bannerModelActive] ?? false,
    );
  }

  /* ----------------------------------------------------------------------- */
  /*                             STATIC FUNCTION                             */
  /* ----------------------------------------------------------------------- */

  /// Static function to create an empty [BannerModel].
  // static BannerModel empty() => BannerModel(
  //       id: '',
  //       name: '',
  //       image: '',
  //       isFeatured: false,
  //     );

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Convert MODEL to JSON structure so that you can store data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      ETexts.bannerModelImageUrl: imageUrl,
      ETexts.bannerModelTargetScreen: targetScreen,
      ETexts.bannerModelActive: active,
    };
  }

  /* ----------------------------------------------------------------------- */
}
