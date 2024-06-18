import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppChipTheme {
  //! Hàm xây dựng riêng tư
  EAppChipTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static ChipThemeData lightChipTheme = ChipThemeData(
    selectedColor: EColors.primary,
    disabledColor: EColors.grey.withOpacity(0.4),
    checkmarkColor: EColors.white,
    //
    labelStyle: const TextStyle(color: EColors.black),
    padding: const EdgeInsets.all(12),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static ChipThemeData darkChipTheme = const ChipThemeData(
    selectedColor: EColors.primary,
    disabledColor: EColors.grey,
    checkmarkColor: EColors.white,
    //
    labelStyle: TextStyle(color: EColors.white),
    padding: EdgeInsets.all(12),
  );
}
