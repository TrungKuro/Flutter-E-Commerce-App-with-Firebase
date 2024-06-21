import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppBarTheme {
  //? Hàm xây dựng riêng tư
  EAppBarTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    //
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    //
    iconTheme: IconThemeData(color: EColors.black, size: 24),
    actionsIconTheme: IconThemeData(color: EColors.black, size: 24),
    //
    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: EColors.black),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    //
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    //
    iconTheme: IconThemeData(color: EColors.white, size: 24),
    actionsIconTheme: IconThemeData(color: EColors.white, size: 24),
    //
    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: EColors.white),
  );
}
