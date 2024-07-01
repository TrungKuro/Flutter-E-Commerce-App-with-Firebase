import 'package:e_commerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* ------------------------------------------------------------------------- */

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController()); //!

    return Scaffold(
      /* ------------------------------------------------------------------- */
      /*                                 BODY                                */
      /* ------------------------------------------------------------------- */

      body: Stack(
        children: [
          /* --------------------------------------------------------------- */

          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: EImages.onBoardingImage1,
                title: ETexts.onBoardingTitle1,
                subTitle: ETexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: EImages.onBoardingImage2,
                title: ETexts.onBoardingTitle2,
                subTitle: ETexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: EImages.onBoardingImage3,
                title: ETexts.onBoardingTitle3,
                subTitle: ETexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular next button
          const OnBoardingNextButton(),

          /* --------------------------------------------------------------- */
        ],
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
