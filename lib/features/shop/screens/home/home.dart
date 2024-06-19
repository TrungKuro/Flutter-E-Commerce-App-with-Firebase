import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! Test phần layout hộp chứa tiêu đề
            EPrimaryHeaderContainer(
              child: SizedBox(
                height: EHelperFunctions.screenHeight() * 2 / 3,
                width: double.infinity,
                child: const Center(child: Text('H.O.M.E')),
              ),
            ), //!
          ],
        ),
      ),
    );
  }
}
