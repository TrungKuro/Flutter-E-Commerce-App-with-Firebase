import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ECouponCode extends StatelessWidget {
  const ECouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return ERoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? EColors.dark : EColors.white,
      padding: const EdgeInsets.only(
        top: ESizes.sm,
        bottom: ESizes.sm,
        right: ESizes.sm,
        left: ESizes.md,
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: ETexts.hintTextCouponCode,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {}, //?
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark ? EColors.white.withOpacity(0.5) : EColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text(ETexts.apply),
            ),
          ),
        ],
      ),
    );
  }
}
