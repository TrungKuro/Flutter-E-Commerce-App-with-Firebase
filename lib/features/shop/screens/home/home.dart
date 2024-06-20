import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EPrimaryHeaderContainer(
              height: 400,
              child: Column(
                children: [
                  /// AppBar
                  EHomeAppBar(),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /// SearchBar
                  ESearchContainer(text: ETexts.searchBarTitle),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /// Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
