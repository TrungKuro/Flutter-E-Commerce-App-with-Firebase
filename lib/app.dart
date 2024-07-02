import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* ------------------------------------------------------------------------- */

/// Use this class to:
/// - setup Themes
/// - initial Bindings
/// - initial Animations
/// - and much more using Material Widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /* ------------------------------------------------------------------- */
      debugShowCheckedModeBanner: false,
      /* ------------------------------------------------------------------- */
      themeMode: ThemeMode.system,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
      /* ------------------------------------------------------------------- */

      // Show Loader or Circular Progress Indicator.
      // Meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(
        backgroundColor: EColors.primary,
        body: Center(child: CircularProgressIndicator(color: EColors.white)),
      ),

      /* ------------------------------------------------------------------- */
    );
  }
}
