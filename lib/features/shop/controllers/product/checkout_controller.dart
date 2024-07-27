import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/payment_method_model.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value = PaymentMethodModel(
      name: 'Paypal',
      image: EImages.paypal,
    );
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(ESizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ESectionHeading(title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: ESizes.spaceBtwSections),
              EPaymentTile(paymentMethod: PaymentMethodModel(image: EImages.paypal, name: 'Paypal')),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              EPaymentTile(paymentMethod: PaymentMethodModel(image: EImages.googlePay, name: 'Google Pay')),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              EPaymentTile(paymentMethod: PaymentMethodModel(image: EImages.applePay, name: 'Apple Pay')),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              EPaymentTile(paymentMethod: PaymentMethodModel(image: EImages.visa, name: 'VISA')),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              EPaymentTile(paymentMethod: PaymentMethodModel(image: EImages.masterCard, name: 'Master Card')),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              EPaymentTile(paymentMethod: PaymentMethodModel(image: EImages.paytm, name: 'Paytm')),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              EPaymentTile(paymentMethod: PaymentMethodModel(image: EImages.paystack, name: 'Paystack')),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              EPaymentTile(paymentMethod: PaymentMethodModel(image: EImages.creditCard, name: 'Credit Card')),
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              const SizedBox(height: ESizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
