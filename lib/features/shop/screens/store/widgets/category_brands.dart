import 'package:e_commerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_app/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:e_commerce_app/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // Handle loader, no record or error message
        const loader = Column(
          children: [
            EListTileShimmer(),
            SizedBox(height: ESizes.spaceBtwItems),
            EBoxesShimmer(),
            SizedBox(height: ESizes.spaceBtwItems),
          ],
        );

        final widget = ECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        // Record found!
        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3), //!!!
              builder: (context, snapshot) {
                // Handle loader , no record, or error message
                final widget = ECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                // record found!
                final products = snapshot.data!;

                return EBrandShowcase(
                  brand: brand,
                  images: products.map((e) => e.thumbnail).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}

/// Brand first (Top 3 products)
/// Brand second (Top 3 products)
/// Brand third (Top 3 products)
