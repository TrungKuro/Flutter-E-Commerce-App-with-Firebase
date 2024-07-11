import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: const EAppBar(
        showBackArrow: true,
        title: Text('Sports'), //!!!
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /* ----------------------------------------------------------- */

              /// Banner
              const ERoundedImage(
                imageUrl: EImages.promoBanner3, //!!!
                width: double.infinity,
                fit: BoxFit.cover,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              /* ----------------------------------------------------------- */

              /// Sub-Categories
              Column(
                children: [
                  ESectionHeading(
                    title: 'Sports shirts', //!!!
                    onPressed: () {}, //?
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4, //!!!
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
                      itemBuilder: (context, index) => const EProductCardHorizontal(),
                    ),
                  ),
                ],
              ),

              /* ----------------------------------------------------------- */

              //!!!

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ),
    );
  }
}
