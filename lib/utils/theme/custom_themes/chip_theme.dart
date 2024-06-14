import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppChipTheme {
  //! Hàm xây dựng riêng tư
  EAppChipTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static ChipThemeData lightChipTheme = ChipThemeData(
    selectedColor: Colors.blue,
    disabledColor: Colors.grey.withOpacity(0.4),
    checkmarkColor: Colors.white,
    //
    labelStyle: const TextStyle(color: Colors.black),
    padding: const EdgeInsets.all(12),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static ChipThemeData darkChipTheme = const ChipThemeData(
    selectedColor: Colors.blue,
    disabledColor: Colors.grey,
    checkmarkColor: Colors.white,
    //
    labelStyle: TextStyle(color: Colors.white),
    padding: EdgeInsets.all(12),
  );
}
