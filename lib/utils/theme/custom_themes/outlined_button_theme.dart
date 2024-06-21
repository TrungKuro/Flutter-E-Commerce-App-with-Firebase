import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppOutlinedButtonTheme {
  //? Hàm xây dựng riêng tư
  EAppOutlinedButtonTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      //
      foregroundColor: EColors.black,
      //
      side: const BorderSide(color: EColors.borderPrimary),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, color: EColors.textBlack, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      //
      foregroundColor: EColors.white,
      //
      side: const BorderSide(color: EColors.borderPrimary),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, color: EColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
