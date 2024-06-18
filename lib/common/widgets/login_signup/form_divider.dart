import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EFormDivider extends StatelessWidget {
  const EFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
            color: isDark ? EColors.darkerGrey : EColors.darkGrey,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
            color: isDark ? EColors.darkerGrey : EColors.darkGrey,
          ),
        ),
      ],
    );
  }
}
