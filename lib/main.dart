import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

void main() {
  runApp(const MainApp());
}

/* ------------------------------------------------------------------------- */

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* ------------------------------------------------------------------- */
      themeMode: ThemeMode.system,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
      /* ------------------------------------------------------------------- */
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
      /* ------------------------------------------------------------------- */
    );
  }
}
