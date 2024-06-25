import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';

/* ------------------------------------------------------------------------- */

class EDeviceUtils {
  /* ------------------------------- KEYBOARD ------------------------------ */

  // Cho ẩn bàn phím ảo
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // Lấy thông số chiều cao của bàn phím ảo
  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets; //!
    return viewInsets.bottom;
  }

  // Cho biết bàn phím ảo có đang hiển thị hay ko?
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets; //!
    return viewInsets.bottom > 0;
  }

  /* ------------------------------ STATUS BAR ----------------------------- */

  // Thay đổi màu sắc của thanh trạng thái
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  // Lấy thông số chiều cao của thanh trạng thái
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top; //!
  }

  // Cho ẩn thanh trạng thái
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // Cho hiện thanh trạng thái
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  /* -------------------------------- OTHER -------------------------------- */

  // Lấy thông số chiều cao của [BottomNavigationBar]
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  // Lấy thông số chiều cao của [AppBar]
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  // Lấy thông số phần đệm trên cùng của giữa các [Material List Items]
  static double getMaterialListPadding() {
    return kMaterialListPadding.top;
  }

  /* ----------------------------- ORIENTATION ----------------------------- */

  // static bool isLandscapeOrientation(BuildContext context) {
  //   final viewInsets = View.of(context).viewInsets;
  //   return viewInsets.bottom == 0;
  // }

  // Kiểm tra màn hình có đang nằm NGANG hay ko?
  static bool isLandscapeOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // static bool isPortraitOrientation(BuildContext context) {
  //   final viewInsets = View.of(context).viewInsets;
  //   return viewInsets.bottom != 0;
  // }

  // Kiểm tra màn hình có đang nằm DỌC hay ko?
  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // Cài đặt hướng xoay ưa thích của thiết bị
  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /* -------------------------------- SCREEN ------------------------------- */

  // Cho phép hiển thị full màn hình hoặc ko?
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  // Lấy tỉ lệ màn hình Pixel của thiết bị
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio; //!
  }

  // Lấy kích thước CHIỀU CAO của màn hình
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height; //!
  }

  // Lấy kích thước CHIỀU NGANG của màn hình
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /* ------------------------------- VIBRATE ------------------------------- */

  // Cho chạy tính năng rung của thiết bị
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /* ---------------------------------- OS --------------------------------- */

  // Kiểm tra OS hiện tại của thiết bị là iOS phải ko?
  static bool isIOS() {
    return Platform.isIOS;
  }

  // Kiểm tra OS hiện tại của thiết bị là Android phải ko?
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Kiểm tra OS hiện tại của thiết bị là gì?
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  /* ------------------------------- INTERNET ------------------------------ */

  // Kiểm tra thiết bị đang có kết nối Internet ko?
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  // Cho thiết bị khởi chạy URL
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /* ----------------------------------------------------------------------- */
}
