import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppCheckboxTheme {
  //? Hàm xây dựng riêng tư
  EAppCheckboxTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith(
      (states) => (states.contains(WidgetState.selected)) ? EColors.white : EColors.black,
    ),
    fillColor: WidgetStateProperty.resolveWith(
      (states) => (states.contains(WidgetState.selected)) ? EColors.primary : Colors.transparent,
    ),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith(
      (states) => (states.contains(WidgetState.selected)) ? EColors.white : EColors.black,
    ),
    fillColor: WidgetStateProperty.resolveWith(
      (states) => (states.contains(WidgetState.selected)) ? EColors.primary : Colors.transparent,
    ),
  );
}
