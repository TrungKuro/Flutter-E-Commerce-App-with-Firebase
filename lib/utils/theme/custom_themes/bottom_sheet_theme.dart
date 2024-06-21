import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppBottomSheetTheme {
  //? Hàm xây dựng riêng tư
  EAppBottomSheetTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    //
    backgroundColor: EColors.light,
    modalBackgroundColor: EColors.light,
    //
    constraints: const BoxConstraints(minWidth: double.infinity),
    //
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    //
    backgroundColor: EColors.dark,
    modalBackgroundColor: EColors.dark,
    //
    constraints: const BoxConstraints(minWidth: double.infinity),
    //
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
