import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppElevatedButtonTheme {
  //! Hàm xây dựng riêng tư
  EAppElevatedButtonTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      //
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      //
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      //
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      //
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      //
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      //
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
