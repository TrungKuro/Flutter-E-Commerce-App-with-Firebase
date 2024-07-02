import 'package:e_commerce_app/app.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* ------------------------------------------------------------------------- */

Future<void> main() async {
  // Todo: Add Widgets Binding

  // Todo: Init Local Storage

  // Todo: Init Payment Methods

  // Todo: Await Native Splash

  // Todo: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    // Todo: Initialize Authentication
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  //! Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
