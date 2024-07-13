import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find(); //!

  /* ----------------------------------------------------------------------- */
  /*                                 VARIABLE                                */
  /* ----------------------------------------------------------------------- */

  //! Sử dụng gói "connectivity_plus"
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<ConnectivityResult> _connectivitySubscription;

  //! Observable
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /* ----------------------------------------------------------------------- */
  /*                                 OVERRIDE                                */
  /* ----------------------------------------------------------------------- */

  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }

  /* ----------------------------------------------------------------------- */
  /*                                 FUNCTION                                */
  /* ----------------------------------------------------------------------- */

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    /* --------------------------------------------------------------------- */

    _connectionStatus.value = result;

    // Ko có kết nối Internet
    if (_connectionStatus.value == ConnectivityResult.none) {
      ELoaders.warningSnackBar(
        title: ETexts.noInternetTitle,
        message: ETexts.noInternetMsg,
      );
    }
    // Có kết nối Internet
    else {
      ELoaders.infoSnackBar(
        title: ETexts.reconnectInternetTitle,
        message: ETexts.reconnectInternetMsg,
      );
    }

    /* --------------------------------------------------------------------- */
  }

  /// Check the internet connection status.
  /// Return 'true' if connected, 'false' otherwise.
  Future<bool> isConnected() async {
    try {
      /* ------------------------------------------------------------------- */

      // final result = await _connectivity.checkConnectivity();
      // if (result == ConnectivityResult.none) {
      //   return false;
      // } else {
      //   return true;
      // }

      if (_connectionStatus.value == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }

      /* ------------------------------------------------------------------- */
    } on PlatformException catch (_) {
      return false;
    }
  }

  /* ----------------------------------------------------------------------- */
}
