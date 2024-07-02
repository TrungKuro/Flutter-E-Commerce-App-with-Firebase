import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EBrandCard extends StatelessWidget {
  const EBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return GestureDetector(
      onTap: onTap, //?
      /// Container Design
      child: ERoundedContainer(
        padding: const EdgeInsets.all(ESizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Icon Categories
            Flexible(
              child: ECircularImage(
                image: EImages.toysIcon, //!!!
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? EColors.white : EColors.black,
                padding: const EdgeInsets.all(ESizes.sm),
                isClip: false,
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
  }
}
