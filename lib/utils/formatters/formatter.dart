import 'package:intl/intl.dart';

/* ------------------------------------------------------------------------- */

class EFormatter {
  /* ----------------------------- DATE & TIME ----------------------------- */

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();

    // Customize the date format as needed
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  /* ------------------------------- CURRENCY ------------------------------ */

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  /* ----------------------------- PHONE NUMBER ---------------------------- */

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }

    // Add more custom phone number formatting logic for different formats if needed.
    return phoneNumber;
  }

  //! Not fully tested.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Loại bỏ các ký tự không phải số
    phoneNumber = phoneNumber.replaceAll(RegExp(r"[^\d]"), "");

    // Thêm mã quốc gia nếu thiếu
    if (phoneNumber.startsWith('0')) {
      phoneNumber = '+84$phoneNumber';
    }

    // Format số điện thoại
    // Ví dụ, input là: 0912345678
    // Thì output là: +84 912 345 678
    return phoneNumber.replaceFirst(RegExp(r"(\d{3})(\d{3})(\d{3})"), r"+$1 $2 $3");
  }

  /* ----------------------------------------------------------------------- */
}
