import 'package:e_commerce_app/common/widgets/images/circular_image.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class EUserProfileTile extends StatelessWidget {
  const EUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance; //!

    return ListTile(
      leading: const ECircularImage(
        image: EImages.user, //! For test UI
        padding: EdgeInsets.all(ESizes.xs / 2),
        backgroundColor: EColors.accent,
      ),
      title: Obx(
        () => Text(
          controller.fullNameUser.value, // ETexts.nameValue, //! For test UI
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white),
        ),
      ),
      subtitle: Text(
        controller.user.value.email, // ETexts.emailValue, //! For test UI
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: EColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed, //?
        icon: const Icon(Iconsax.edit, color: EColors.white),
      ),
    );
  }
}
