import 'package:e_commerce_app/common/widgets/image_text/vertical_image_text.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class EHomeCategories extends StatelessWidget {
  const EHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> categories = [
      const EVerticalImageText(image: EImages.animalsIcon, title: ETexts.animals),
      const EVerticalImageText(image: EImages.clothesIcon, title: ETexts.clothes),
      const EVerticalImageText(image: EImages.cosmeticsIcon, title: ETexts.cosmetics),
      const EVerticalImageText(image: EImages.electronicsIcon, title: ETexts.electronics),
      const EVerticalImageText(image: EImages.furnitureIcon, title: ETexts.furniture),
      const EVerticalImageText(image: EImages.jewelleryIcon, title: ETexts.jewellery),
      const EVerticalImageText(image: EImages.shoesIcon, title: ETexts.shoes),
      const EVerticalImageText(image: EImages.sportsIcon, title: ETexts.sports),
      const EVerticalImageText(image: EImages.toysIcon, title: ETexts.toys),
    ]; //!

    return SizedBox(
      height: 85,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace),
        separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
        itemBuilder: (_, index) {
          return categories[index];
        },
      ),
    );
  }
}
