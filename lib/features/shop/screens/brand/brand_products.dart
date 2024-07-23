import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/product/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({
    super.key,
    required this.brand,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        showBackArrow: true,
        title: Text(brand.name),
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

              /// Brand Detail
              EBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Sort
              FutureBuilder(
                future: controller.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  // Handle loader, no record or error message
                  const loader = EVerticalProductShimmer();
                  final widget = ECloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;

                  // Record found!
                  final brandProducts = snapshot.data!;
                  return ESortableProducts(products: brandProducts);
                },
              ),

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
