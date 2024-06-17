import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/* ------------------------------------------------------------------------- */

class EHelperFunctions {
  /* ----------------------------------------------------------------------- */

  // Xác định màu sắc cụ thể của sản phẩm của bạn
  // Và nó sẽ khớp với thuộc tính màu và hiển thị cụ thể
  static Color? getColor(String value) {
    switch (value) {
      case 'Green':
        return Colors.green;
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Pink':
        return Colors.pink;
      case 'Grey':
        return Colors.grey;
      case 'Purple':
        return Colors.purple;
      case 'Black':
        return Colors.black;
      case 'White':
        return Colors.white;
      case 'Yellow':
        return Colors.yellow;
      case 'Orange':
        return Colors.deepOrange;
      case 'Brown':
        return Colors.brown;
      case 'Teal':
        return Colors.teal;
      case 'Indigo':
        return Colors.indigo;
      default:
        return null;
    }
  }

  /* ----------------------------------------------------------------------- */

  // Cho hiển thị thông báo bằng thanh [SnackBar]
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
  }

  /* ----------------------------------------------------------------------- */

  // Cho hiện thị bảng thông báo
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /* ----------------------------------------------------------------------- */

  // Thực hiện việc chuyển trang
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  /* ----------------------------------------------------------------------- */

  // Thực hiện việc cắt ngắn văn bản theo độ dài mong muốn
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  /* ----------------------------------------------------------------------- */

  // Cho biết ứng dụng có đang ở chế độ Dark hay ko?
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /* ----------------------------------------------------------------------- */

  // Trả về kích thước màn hình
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  // Trả về kích thước CHIỀU CAO của màn hình
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // Trả về kích thước CHIỀU NGANG của màn hình
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /* ----------------------------------------------------------------------- */

  // Lấy định dạng Date của hệ thống
  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  /* ----------------------------------------------------------------------- */

  // Loại bỏ các phần tử trùng lặp trong danh sách bất kì
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /* ----------------------------------------------------------------------- */

  //  Gói các Widget lại với nhau
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
