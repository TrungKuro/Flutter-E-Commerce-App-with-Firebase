import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EUserProfileTile extends StatelessWidget {
  const EUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ECircularImage(
        image: EImages.user, //!!!
        padding: EdgeInsets.all(ESizes.xs / 2),
        backgroundColor: EColors.accent,
      ),
      title: Text(
        ETexts.userNameValue, //!!!
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white),
      ),
      subtitle: Text(
        ETexts.emailValue, //!!!
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: EColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed, //?
        icon: const Icon(Iconsax.edit, color: EColors.white),
      ),
    );
  }
}
