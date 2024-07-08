import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ESocialButtons extends StatelessWidget {
  const ESocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController()); //!
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon Google
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(), //?
            icon: const Image(
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImages.google),
            ),
          ),
        ),
        // Spacer
        const SizedBox(width: ESizes.spaceBtwItems),
        // Icon Facebook
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {}, //?
            icon: const Image(
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
