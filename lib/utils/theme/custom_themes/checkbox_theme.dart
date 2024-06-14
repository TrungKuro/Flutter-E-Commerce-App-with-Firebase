import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppCheckboxTheme {
  //! Hàm xây dựng riêng tư
  EAppCheckboxTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) => (states.contains(MaterialState.selected)) ? Colors.white : Colors.black,
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) => (states.contains(MaterialState.selected)) ? Colors.blue : Colors.transparent,
    ),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) => (states.contains(MaterialState.selected)) ? Colors.white : Colors.black,
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) => (states.contains(MaterialState.selected)) ? Colors.blue : Colors.transparent,
    ),
  );
}
