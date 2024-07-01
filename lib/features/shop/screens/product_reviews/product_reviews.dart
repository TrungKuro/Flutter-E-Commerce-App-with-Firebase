import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/overall_product_ratings.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: const EAppBar(title: Text(ETexts.reviewAndRatingAppBarTitle), showBackArrow: true),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* ----------------------------------------------------------- */

              /// Intro
              const Text(ETexts.reviewAndRatingAppBarSubTitle),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Overall Product Ratings
              const EOverallProductRatings(),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ERatingBarIndicator(rating: 3.7), //!!!
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  Text('12,345', style: Theme.of(context).textTheme.bodySmall), //!!!
                ],
              ),

              /* ----------------------------------------------------------- */

              const SizedBox(height: ESizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),

              /* ----------------------------------------------------------- */

              /// User Reviews List
              const EUserReviewCard(),
              const EUserReviewCard(),
              const EUserReviewCard(),
              const EUserReviewCard(),

              /* ----------------------------------------------------------- */

              SizedBox(height: EDeviceUtils.getBottomNavigationBarHeight()),

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
