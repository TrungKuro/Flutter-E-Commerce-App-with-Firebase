import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class EAppTextFieldTheme {
  //? Hàm xây dựng riêng tư
  EAppTextFieldTheme._();

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    //
    prefixIconColor: EColors.buttonSecondary,
    suffixIconColor: EColors.buttonSecondary,
    //
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: EColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: EColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: EColors.black.withValues(alpha: 0.8)),
    //
    border: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: EColors.grey)),
    enabledBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: EColors.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: EColors.black)),
    errorBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: EColors.error)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 2, color: EColors.warning)),
  );

  /* ----------------------------- Trường tĩnh ----------------------------- */

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    //
    prefixIconColor: EColors.buttonSecondary,
    suffixIconColor: EColors.buttonSecondary,
    //
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: EColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: EColors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: EColors.white.withValues(alpha: 0.8)),
    //
    border: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: EColors.grey)),
    enabledBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: EColors.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: EColors.white)),
    errorBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: EColors.error)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 2, color: EColors.warning)),
  );
}
