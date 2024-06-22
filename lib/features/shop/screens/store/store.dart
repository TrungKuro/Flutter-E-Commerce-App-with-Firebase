import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Scaffold(
      appBar: EAppBar(
        title: Text(
          ETexts.storeAppBarTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          ECartCounterIcon(
            onPressed: () {}, //!
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              /* ----------------------------------------------------------- */
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: isDark ? EColors.dark : EColors.light,
              expandedHeight: ENumberConstants.heightHeaderStore,
              /* ----------------------------------------------------------- */
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(ESizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search Bar
                    const SizedBox(height: ESizes.spaceBtwItems),
                    const ESearchContainer(
                      text: ETexts.searchBarTitle,
                      padding: EdgeInsets.zero,
                      showBorder: true,
                      showBackground: false,
                    ),
                    const SizedBox(height: ESizes.spaceBtwSections),

                    /// Title "Featured Brands"
                    ESectionHeading(
                      title: ETexts.brandsTitle,
                      onPressed: () {}, //!
                    ),
                    const SizedBox(height: ESizes.spaceBtwItems / 1.5),

                    /// List "Featured Brands"
                    EGridLayout(
                      itemCount: ENumberConstants.featuredBrandNumber,
                      mainAxisExtent: ENumberConstants.heightFeaturedBrand,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {}, //!
                          child: ERoundedContainer(
                            padding: const EdgeInsets.all(ESizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                /// Icon Categories
                                Flexible(
                                  child: ECircularImage(
                                    isNetworkImage: false,
                                    image: EImages.toysIcon,
                                    backgroundColor: Colors.transparent,
                                    overlayColor: isDark ? EColors.white : EColors.black,
                                  ),
                                ),
                                const SizedBox(width: ESizes.spaceBtwItems / 2),

                                /// Info
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /// Name Brand
                                      const EBrandTitleWithVerifiedIcon(
                                        title: 'Nike', //!!!
                                        brandTextSize: TextSizes.large,
                                      ),

                                      /// Number Product
                                      Text(
                                        '256 products', //!!!
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    //!!!
                  ],
                ),
              ),
              /* ----------------------------------------------------------- */
            ),
          ];
        },
        body: Container(
          color: Colors.amber,
          child: const Center(child: Text('S.T.O.R.E')),
        ),
      ),
    );
  }
}
