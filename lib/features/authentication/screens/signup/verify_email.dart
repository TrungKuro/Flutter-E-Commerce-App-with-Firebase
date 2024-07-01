import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 TOP                                 */
      /* ------------------------------------------------------------------- */

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()), //?
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),

      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /* ----------------------------------------------------------- */

              /// Image
              Image(
                width: EHelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(EImages.deliveredEmailIllustration),
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Title & SubTitle
              Text(
                ETexts.confirmEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text(
                ETexts.emailValue, //!!!
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text(
                ETexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: EImages.staticSuccessIllustration,
                      title: ETexts.yourAccountCreatedTitle,
                      subTitle: ETexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()), //?
                    ),
                  ), //?
                  child: const Text(ETexts.tContinue),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {}, //?
                  child: const Text(ETexts.resendEmail),
                ),
              ),

              /* ----------------------------------------------------------- */
            ],
          ),
        ),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
