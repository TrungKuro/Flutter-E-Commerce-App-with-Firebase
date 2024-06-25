import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EPrimaryHeaderContainer extends StatelessWidget {
  const EPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ECurvedEdgeWidget(
      child: Container(
        /* ----------------------------------------------------------------- */
        color: EColors.primary,
        padding: const EdgeInsets.only(bottom: 0),
        /* ----------------------------------------------------------------- */
        child: Stack(
          children: [
            /// Background Custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: ECircularContainer(backgroundColor: EColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: ECircularContainer(backgroundColor: EColors.textWhite.withOpacity(0.1)),
            ),

            /// Content on Background
            child,
          ],
        ),
        /* ----------------------------------------------------------------- */
      ),
    );
  }
}
