import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/overall_product_ratings.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        title: Text('Reviews & Ratings'), //!!!
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Rating and reviews are verified and are from people who use the same type of device that you use."), //!!!
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Overall Product Ratings
              const EOverallProductRatings(),
              const ERatingBarIndicator(rating: 3.5),
              Text(
                '12,611', //!!!
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// User Reviews List
              const EUserReviewCard(),
              const EUserReviewCard(),
              const EUserReviewCard(),
              const EUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
