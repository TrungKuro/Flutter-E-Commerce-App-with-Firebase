import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! Test phần layout hộp chứa tiêu đề
            EPrimaryHeaderContainer(
              child: Center(child: Text('H.O.M.E')),
            ), //!
          ],
        ),
      ),
    );
  }
}
