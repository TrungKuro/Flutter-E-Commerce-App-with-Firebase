import 'package:e_commerce_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppTheme {
  //! Hàm xây dựng riêng tư
  EAppTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    //
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue, //!
    //
    textTheme: EAppTextTheme.lightTextTheme,
    elevatedButtonTheme: EAppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: EAppBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: EAppCheckboxTheme.lightCheckboxTheme,
    chipTheme: EAppChipTheme.lightChipTheme,
    outlinedButtonTheme: EAppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: EAppTextFieldTheme.lightInputDecorationTheme,
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    //
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.blue, //!
    //
    textTheme: EAppTextTheme.darkTextTheme,
    elevatedButtonTheme: EAppElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: EAppBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: EAppCheckboxTheme.darkCheckboxTheme,
    chipTheme: EAppChipTheme.darkChipTheme,
    outlinedButtonTheme: EAppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: EAppTextFieldTheme.darkInputDecorationTheme,
  );
}
