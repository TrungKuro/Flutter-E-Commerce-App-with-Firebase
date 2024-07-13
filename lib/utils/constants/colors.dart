import 'package:flutter/material.dart';

class EColors {
  //? Hàm xây dựng riêng tư
  EColors._();

  /* --------------------------- App Basic Colors -------------------------- */

  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFffe24b);
  //
  static const Color accent = Color(0xFFb0c7ff);

  /* --------------------------- Gradient Colors --------------------------- */

  static Gradient linerGradient = const LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFFff9a9e),
      Color(0xFFfad0c4),
      Color(0xFFfad0c4),
    ],
  );

  /* ---------------------------- Shimmer Colors --------------------------- */

  static Color? darkShimmerBase = Colors.grey[850];
  static Color? lightShimmerBase = Colors.grey[300];

  static Color? darkShimmerHightLight = Colors.grey[700];
  static Color? lightShimmerHightLight = Colors.grey[100];

  /* ----------------------------- Icon Colors ----------------------------- */

  static const Color favourite = Colors.red;
  static const Color rating = Colors.amber;

  /* ----------------------------- Text Colors ----------------------------- */

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c757d);
  //
  static const Color textWhite = Colors.white;
  static const Color textBlack = Colors.black;
  static const Color textRed = Colors.red;

  /* -------------------------- Background Colors -------------------------- */

  static const Color light = Color(0xFFf6f6f6);
  static const Color dark = Color(0xFF272727);
  //
  static const Color primaryBackground = Color(0xFFf3f5ff);

  //! Tăng cường độ đậm 30% cho màu "light"
  static Color lightDarker30Per = Color.fromARGB(
    light.alpha,
    (light.red * 0.7).round(),
    (light.green * 0.7).round(),
    (light.blue * 0.7).round(),
  );
  //! Tăng cường độ đậm 30% cho màu "dark"
  static Color darkDarker30Per = Color.fromARGB(
    dark.alpha,
    (dark.red * 0.7).round(),
    (dark.green * 0.7).round(),
    (dark.blue * 0.7).round(),
  );

  //! Tăng cường độ đậm 10% cho màu "light"
  static Color lightDarker10Per = Color.fromARGB(
    light.alpha,
    (light.red * 0.9).round(),
    (light.green * 0.9).round(),
    (light.blue * 0.9).round(),
  );
  //! Tăng cường độ đậm 10% cho màu "dark"
  static Color darkDarker10Per = Color.fromARGB(
    dark.alpha,
    (dark.red * 0.9).round(),
    (dark.green * 0.9).round(),
    (dark.blue * 0.9).round(),
  );

  /* --------------------- Background Container Colors --------------------- */

  static const Color lightContainer = Color(0xFFf6f6f6);
  static Color darkContainer = EColors.white.withOpacity(0.1);

  /* ---------------------------- Button Colors ---------------------------- */

  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6c757d);
  //
  static const Color buttonDisabled = Color(0xFFc4c4c4);

  /* ---------------------------- Border Colors ---------------------------- */

  static const Color borderPrimary = Color(0xFFd9d9d9);
  static const Color borderSecondary = Color(0xFFe6e6e6);

  /* --------------------- Error and Validation Colors --------------------- */

  static const Color error = Color(0xFFd32f2f);
  static const Color dangerous = Colors.red;
  static const Color success = Color(0xFF388e3c);
  static const Color warning = Color(0xFFf57c00);
  static const Color info = Color(0xFF1976d2);

  /* ---------------------------- Neutral Shades --------------------------- */

  static const Color black = Color(0xFF232323);
  //
  static const Color darkerGrey = Color(0xFF4f4f4f);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFe0e0e0);
  static const Color softGrey = Color(0xFFf4f4f4);
  static const Color lightGrey = Color(0xFFf9f9f9);
  //
  static const Color white = Color(0xFFffffff);
}
