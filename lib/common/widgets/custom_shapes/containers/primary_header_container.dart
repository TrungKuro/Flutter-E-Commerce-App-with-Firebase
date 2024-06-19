import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EPrimaryHeaderContainer extends StatelessWidget {
  const EPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ECurvedEdgeWidget(
      child: SizedBox(
        //! Nếu người dùng ko cung cấp các chỉ số kích thước.
        //! Widget sẽ sử dụng các thông số kích thước mặc định sau.
        width: width ?? EHelperFunctions.screenWidth(),
        height: height ?? EHelperFunctions.screenHeight() * 1 / 3,
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
                child: ECircularContainer(backgroundColor: EColors.textWhite.withOpacity(0.1)), //!
              ),
              Positioned(
                top: 100,
                right: -300,
                child: ECircularContainer(backgroundColor: EColors.textWhite.withOpacity(0.1)), //!
              ),

              ///
              child, //!
            ],
          ),
          /* ----------------------------------------------------------------- */
        ),
      ),
    ); //!
  }
}
