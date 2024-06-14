import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppBottomSheetTheme {
  //! Hàm xây dựng riêng tư
  EAppBottomSheetTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    //
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    //
    constraints: const BoxConstraints(minWidth: double.infinity),
    //
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    //
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    //
    constraints: const BoxConstraints(minWidth: double.infinity),
    //
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
