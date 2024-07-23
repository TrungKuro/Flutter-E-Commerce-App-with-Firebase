import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/shimmer/brands_shimmer.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/product/brand_controller.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: const EAppBar(
        showBackArrow: true,
        title: Text(ETexts.brandTitle),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: ESizes.defaultSpace,
            left: ESizes.defaultSpace,
            right: ESizes.defaultSpace,
            bottom: ESizes.defaultSpace + EDeviceUtils.getBottomNavigationBarHeight(),
          ),
          child: Column(
            children: [
              /* ----------------------------------------------------------- */

              /// Heading
              const ESectionHeading(title: ETexts.brandSubTitle, showActionButton: false),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Brands
              Obx(() {
                if (brandController.isLoading.value) return const EBrandsShimmer();

                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No Data Found',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(color: EColors.white),
                    ),
                  );
                }

                return EGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: ENumberConstants.heightFeaturedBrand,
                  itemBuilder: (_, index) {
                    final brand = brandController.allBrands[index];
                    return EBrandCard(
                      showBorder: false,
                      brand: brand,
                      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)), //?
                    );
                  },
                );
              }),

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
