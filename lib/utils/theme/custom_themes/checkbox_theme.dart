import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppCheckboxTheme {
  //! Hàm xây dựng riêng tư
  EAppCheckboxTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) => (states.contains(MaterialState.selected)) ? EColors.white : EColors.black,
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) => (states.contains(MaterialState.selected)) ? EColors.primary : Colors.transparent,
    ),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) => (states.contains(MaterialState.selected)) ? EColors.white : EColors.black,
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) => (states.contains(MaterialState.selected)) ? EColors.primary : Colors.transparent,
    ),
  );
}
