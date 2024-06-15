import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';

/* ------------------------------------------------------------------------- */

class App extends StatelessWidget {
  const App({super.key});

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
