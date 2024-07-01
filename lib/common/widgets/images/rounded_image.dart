import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ERoundedImage extends StatelessWidget {
  const ERoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = EColors.light,
    this.fit = BoxFit.contain,
    this.paddingAll,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = ESizes.productImageRadius,
    this.padding,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final double? paddingAll;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, //?
      child: Container(
        width: width,
        height: height,
        //! Thuộc tính "padding" được ưu tiên hơn "paddingAll" nếu nó được sử dụng
        padding: (padding != null)
            ? padding
            : (paddingAll != null)
                ? EdgeInsets.all(paddingAll!)
                : null,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: (applyImageRadius)
              ? (paddingAll != null)
                  //! Tạo hiệu ứng "Nested corner radii"
                  ? BorderRadius.circular(borderRadius - paddingAll!)
                  : BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
