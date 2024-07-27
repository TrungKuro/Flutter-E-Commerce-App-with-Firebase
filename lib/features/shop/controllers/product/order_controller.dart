import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/data/repositories/order/order_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/features/shop/models/order_model.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variable
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      ELoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // start loader
      EFullScreenLoader.openLoadingDialog('Processing your order', EImages.pencilAnimation);

      // get user authentication id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      // Add details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        items: cartController.cartItems.toList(),
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // Show success screen
      Get.off(() => SuccessScreen(
            image: EImages.orderCompletedAnimation,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const NavigationMenu()), //?
          ));
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
