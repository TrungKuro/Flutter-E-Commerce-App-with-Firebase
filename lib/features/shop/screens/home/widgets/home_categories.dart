import 'package:e_commerce_app/common/widgets/image_text/vertical_image_text.dart';
import 'package:e_commerce_app/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/screens/sub_category/sub_categories.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
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
    final categoryController = Get.put(CategoryController()); //!

    // List<Widget> categories = [
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.animalsIcon,
    //     title: ETexts.animals,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.clothesIcon,
    //     title: ETexts.clothes,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.cosmeticsIcon,
    //     title: ETexts.cosmetics,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.electronicsIcon,
    //     title: ETexts.electronics,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.furnitureIcon,
    //     title: ETexts.furniture,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.jewelleryIcon,
    //     title: ETexts.jewellery,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.shoesIcon,
    //     title: ETexts.shoes,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.sportsIcon,
    //     title: ETexts.sports,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    //   EVerticalImageText(
    //     image: EImages.toysIcon,
    //     title: ETexts.toys,
    //     onTap: () => Get.to(() => const SubCategoriesScreen()), //?
    //   ),
    //   /* ------------------------------------------------------------------- */
    // ]; //!

    //! To view observable variable ... of [CategoryController]
    return Obx(
      () {
        if (categoryController.isLoading.value) return const ECategoryShimmer();

        if (categoryController.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              ETexts.noDataFound,
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: EColors.white),
            ),
          );
        }

        return SizedBox(
          height: 85,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace),
            separatorBuilder: (context, index) => const SizedBox(width: ESizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return EVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen(category: category)), //?
              ); // categories[index]
            },
          ),
        );
      },
    );
  }
}
