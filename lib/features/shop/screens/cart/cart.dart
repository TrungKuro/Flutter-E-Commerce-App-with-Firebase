import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: EAppBar(
        showBackArrow: true,
        title: Text(ETexts.cartScreenAppBarTitle, style: Theme.of(context).textTheme.headlineSmall),
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: ENumberConstants.numberProductsInCart, //!!!
          //? Dấu (__) nghĩa là gì, nó khác gì với dấu (_)
          separatorBuilder: (_, __) => const SizedBox(height: ESizes.spaceBtwSections),
          itemBuilder: (_, __) => const Column(
            children: [ECartItem()],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
      /*                                BOTTOM                               */
      /* ------------------------------------------------------------------- */

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: ESizes.defaultSpace,
          left: ESizes.defaultSpace,
          right: ESizes.defaultSpace,
          bottom: EDeviceUtils.getBottomNavigationBarHeight(),
        ),
        child: ElevatedButton(
          onPressed: () {}, //?
          child: const Text('Checkout \$256.0'), //!!!
        ),
      ),
    );
  }
}
