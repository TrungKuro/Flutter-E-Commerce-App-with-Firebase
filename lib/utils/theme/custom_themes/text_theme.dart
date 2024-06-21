import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppTextTheme {
  //? Hàm xây dựng riêng tư
  EAppTextTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: EColors.textBlack),
    headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: EColors.textBlack),
    headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: EColors.textBlack),
    //
    titleLarge: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: EColors.textBlack),
    titleMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: EColors.textBlack),
    titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: EColors.textBlack),
    //
    bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: EColors.textBlack),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: EColors.textBlack),
    bodySmall: const TextStyle()
        .copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: EColors.textBlack.withOpacity(0.5)),
    //
    labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: EColors.textBlack),
    labelMedium: const TextStyle()
        .copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: EColors.textBlack.withOpacity(0.5)),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: EColors.textWhite),
    headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: EColors.textWhite),
    headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: EColors.textWhite),
    //
    titleLarge: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: EColors.textWhite),
    titleMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: EColors.textWhite),
    titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: EColors.textWhite),
    //
    bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: EColors.textWhite),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: EColors.textWhite),
    bodySmall: const TextStyle()
        .copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: EColors.textWhite.withOpacity(0.5)),
    //
    labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: EColors.textWhite),
    labelMedium: const TextStyle()
        .copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: EColors.textWhite.withOpacity(0.5)),
  );
}
