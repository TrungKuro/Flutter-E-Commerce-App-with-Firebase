import 'package:e_commerce_app/common/widgets/loaders/circular_loader.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/data/repositories/address/address_repository.dart';
import 'package:e_commerce_app/features/personalization/models/address_model.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshData = true.obs;

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  // Fetch all user speccific address
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  //!!!
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const ECircularLoader(),
      );

      // Clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" field to TRUE for newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Error in Selection', message: e.toString());
    }
  }

  /// Add new address
  Future addNewAddresses() async {
    try {
      // Start loading
      EFullScreenLoader.openLoadingDialog('Storing Address...', EImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!addressFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Save address data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      // Update selected address status
      address.id = id;
      await selectAddress(address);

      // Remove loader
      EFullScreenLoader.stopLoading();

      // Show success message
      ELoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully.');

      // Refresh addresses data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // remove loader
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  /// Show addresses modalBottomSheet at checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(ESizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(title: 'Select Address', showActionButton: false),
            FutureBuilder(
              future: getAllUserAddresses(),
              builder: (_, snapshot) {
                // handle loader, no record, or error message
                final response = ECloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => ESingleAddress(
                    address: snapshot.data![index],
                    onTap: () async {
                      await selectAddress(snapshot.data![index]);
                      Get.back();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Function to reset from fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
