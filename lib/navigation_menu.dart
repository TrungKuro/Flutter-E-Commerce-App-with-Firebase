import 'package:e_commerce_app/features/personalization/screens/settings/settings.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

/* ------------------------------------------------------------------------- */

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController()); //!
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: isDark ? EColors.black : EColors.white,
          indicatorColor: isDark ? EColors.white.withOpacity(0.1) : EColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: ETexts.home),
            NavigationDestination(icon: Icon(Iconsax.shop), label: ETexts.store),
            NavigationDestination(icon: Icon(Iconsax.heart), label: ETexts.wishList),
            NavigationDestination(icon: Icon(Iconsax.user), label: ETexts.profile),
          ],
        ),
      ),
      /* ------------------------------------------------------------------- */
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

/* ------------------------------------------------------------------------- */

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
