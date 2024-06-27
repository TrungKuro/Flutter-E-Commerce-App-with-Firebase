import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class EProductDescription extends StatelessWidget {
  const EProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESectionHeading(
          title: ETexts.description,
          showActionButton: false,
        ),
        SizedBox(height: ESizes.spaceBtwItems / 2),
        ReadMoreText(
          '''This is a Product description for Blue Nike Sleeve less vest. There are more thing that can be added.

The Nike Air Force 1 is a basketball shoe originally designed by Bruce Kilgore and released in 1982. It has become one of Nike's most popular and iconic shoes. The Air Force 1 has been worn by athletes and celebrities alike, and it has been featured in many movies and TV shows.

The shoe is known for its comfortable design and durable construction. It features a leather or synthetic upper, a padded collar, and a rubber sole. The Air Force 1 is available in a variety of colors and styles, and it can be worn for a variety of occasions.''', //!!!
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ETexts.collapsedDescription,
          trimExpandedText: ETexts.expandedDescription,
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
