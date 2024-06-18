import 'package:e_commerce_app/utils/constants/colors.dart';
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
      foregroundColor: EColors.white,
      backgroundColor: EColors.primary,
      //
      disabledForegroundColor: EColors.buttonDisabled,
      disabledBackgroundColor: EColors.buttonDisabled,
      //
      side: const BorderSide(color: EColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: EColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      //
      foregroundColor: EColors.white,
      backgroundColor: EColors.primary,
      //
      disabledForegroundColor: EColors.buttonDisabled,
      disabledBackgroundColor: EColors.buttonDisabled,
      //
      side: const BorderSide(color: EColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: EColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
