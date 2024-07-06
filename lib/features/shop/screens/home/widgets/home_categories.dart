import 'package:e_commerce_app/common/widgets/image_text/vertical_image_text.dart';
import 'package:e_commerce_app/features/shop/screens/sub_category/sub_categories.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EHomeCategories extends StatelessWidget {
  const EHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> categories = [
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.animalsIcon,
        title: ETexts.animals,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.clothesIcon,
        title: ETexts.clothes,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.cosmeticsIcon,
        title: ETexts.cosmetics,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.electronicsIcon,
        title: ETexts.electronics,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.furnitureIcon,
        title: ETexts.furniture,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.jewelleryIcon,
        title: ETexts.jewellery,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.shoesIcon,
        title: ETexts.shoes,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.sportsIcon,
        title: ETexts.sports,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
      EVerticalImageText(
        image: EImages.toysIcon,
        title: ETexts.toys,
        onTap: () => Get.to(() => const SubCategoriesScreen()), //?
      ),
      /* ------------------------------------------------------------------- */
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
