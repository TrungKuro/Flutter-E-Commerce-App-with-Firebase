import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class EHomeAppBar extends StatelessWidget {
  const EHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ETexts.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: EColors.grey),
          ),
          Text(
            ETexts.userAppBarTitle, //!!!
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white),
          ),
        ],
      ),
      actions: [
        ECartCounterIcon(
          onPressed: () {}, //?
          iconColor: EColors.white,
        ),
      ],
    );
  }
}
