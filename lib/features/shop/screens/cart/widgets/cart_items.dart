import 'package:e_commerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce_app/utils/constants/number_constants.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({
    super.key,
    this.showAddRemoveButtons = true,
    this.scrollable = true,
  });

  final bool showAddRemoveButtons;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: scrollable ? null : const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ENumberConstants.numberProductsInCart, //!!!
      //? Dấu (__) nghĩa là gì, nó khác gì với dấu (_)
      separatorBuilder: (_, __) => const SizedBox(height: ESizes.spaceBtwSections),
      itemBuilder: (_, __) => Column(
        children: [ECartItem(showAddRemoveButtons: showAddRemoveButtons)],
      ),
    );
  }
}
