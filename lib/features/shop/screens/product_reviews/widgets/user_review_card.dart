import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class EUserReviewCard extends StatelessWidget {
  const EUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Column(
      children: [
        /* --------------------------------------------------------------- */

        /// Infor Customer (name & avatar)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(EImages.userProfileImage1)), //!!!
                const SizedBox(width: ESizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge), //!!!
              ],
            ),
            IconButton(
              onPressed: () {}, //?
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /// Rating's Customer (rating & time)
        Row(
          children: [
            const ERatingBarIndicator(rating: 4), //!!!
            const SizedBox(width: ESizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium), //!!!
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /// Review's Customer
        const SizedBox(
          width: double.infinity,
          child: ReadMoreText(
            "I’m also very pleased with the design of the shoes. They look stylish and modern, and I’ve received many compliments on them. I would highly recommend Nike shoes to anyone looking for a comfortable, durable, and stylish pair of shoes.", //!!!
            trimLines: 1,
            trimMode: TrimMode.Line,
            trimExpandedText: ETexts.expandedDescription,
            trimCollapsedText: ETexts.collapsedDescription,
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primary),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primary),
          ),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),

        /// Reply's Company
        ERoundedContainer(
          backgroundColor: isDark ? EColors.darkerGrey : EColors.grey, //!!!
          child: Padding(
            padding: const EdgeInsets.all(ESizes.md),
            child: Column(
              children: [
                /* ------------------------------------------------------- */

                /// Infor Company (name & time)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nike Store', style: Theme.of(context).textTheme.titleMedium), //!!!
                    Text('02 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium), //!!!
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwItems),

                /// Reply
                const SizedBox(
                  width: double.infinity,
                  child: ReadMoreText(
                    "Thank you for your positive feedback about our Nike shoes. We're glad you're satisfied with the comfort, support, and design. We appreciate your feedback on the shoe's durability. Thank you again for being a loyal Nike customer.",
                    trimLines: 1,
                    trimMode: TrimMode.Line,
                    trimExpandedText: ETexts.expandedDescription,
                    trimCollapsedText: ETexts.collapsedDescription,
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primary),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EColors.primary),
                  ),
                ),
                /* ------------------------------------------------------- */
              ],
            ),
          ),
        ),

        /* --------------------------------------------------------------- */

        const SizedBox(height: ESizes.spaceBtwSections),

        /* --------------------------------------------------------------- */
      ],
    );
  }
}
