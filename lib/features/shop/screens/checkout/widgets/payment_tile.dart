import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/features/shop/models/payment_method_model.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EPaymentTile extends StatelessWidget {
  const EPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: ERoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: EHelperFunctions.isDarkMode(context) ? EColors.light : EColors.white,
        padding: const EdgeInsets.all(ESizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
