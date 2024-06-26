import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
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
    List<Widget> tabs = [
      const Tab(child: Text(ETexts.animals)),
      const Tab(child: Text(ETexts.clothes)),
      const Tab(child: Text(ETexts.cosmetics)),
      const Tab(child: Text(ETexts.electronics)),
      const Tab(child: Text(ETexts.furniture)),
      const Tab(child: Text(ETexts.jewellery)),
      const Tab(child: Text(ETexts.shoes)),
      const Tab(child: Text(ETexts.sports)),
      const Tab(child: Text(ETexts.toys)),
    ]; //!
    List<Widget> tabBarViews = [
      const ECategoryTab(),
      Container(color: Colors.pink, child: const Center(child: Text('1'))),
      Container(color: Colors.red, child: const Center(child: Text('2'))),
      Container(color: Colors.green, child: const Center(child: Text('3'))),
      Container(color: Colors.blue, child: const Center(child: Text('4'))),
      Container(color: Colors.orange, child: const Center(child: Text('5'))),
      Container(color: Colors.purple, child: const Center(child: Text('6'))),
      Container(color: Colors.brown, child: const Center(child: Text('7'))),
      Container(color: Colors.grey, child: const Center(child: Text('8'))),
    ]; //!

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        /// AppBar
        appBar: EAppBar(
          title: Text(
            ETexts.storeAppBarTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            ECartCounterIcon(
              onPressed: () {}, //?
            )
          ],
        ),

        /// Content
        body: NestedScrollView(
          /// Header
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                /* ----------------------------------------------------------- */
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? EColors.black : EColors.white,
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
                        title: ETexts.featuredBrandsTitle,
                        onPressed: () {}, //?
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 1.5),

                      /// List "Featured Brands"
                      EGridLayout(
                        itemCount: ENumberConstants.featuredBrandNumber,
                        mainAxisExtent: ENumberConstants.heightFeaturedBrand,
                        itemBuilder: (_, index) {
                          return const EBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                /// Tabs Categories
                bottom: ETabBard(tabs: tabs),
                /* ----------------------------------------------------------- */
              ),
            ];
          },

          /// Body
          body: TabBarView(children: tabBarViews),
        ),
      ),
    );
  }
}
