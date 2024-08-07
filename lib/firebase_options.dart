// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBSX0Lx8vOReCHBZch-zdpIFskkDy1ObpA',
    appId: '1:724853136311:web:f894a1e95c85a0b98da632',
    messagingSenderId: '724853136311',
    projectId: 'e-commerce-a4785',
    authDomain: 'e-commerce-a4785.firebaseapp.com',
    storageBucket: 'e-commerce-a4785.appspot.com',
    measurementId: 'G-BX5W3GNDT3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaimPq4URNVABBG1m8hrndLyHpCWWlKrA',
    appId: '1:724853136311:android:92f7989ff717c7928da632',
    messagingSenderId: '724853136311',
    projectId: 'e-commerce-a4785',
    storageBucket: 'e-commerce-a4785.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwE6A9963anPBo3UypoFIjLFV5e3l00Ys',
    appId: '1:724853136311:ios:1d72b77fb334e5a48da632',
    messagingSenderId: '724853136311',
    projectId: 'e-commerce-a4785',
    storageBucket: 'e-commerce-a4785.appspot.com',
    androidClientId: '724853136311-dj3bjes8ota099lmji9mom5o6g4p7mhm.apps.googleusercontent.com',
    iosClientId: '724853136311-oq5dr3bj4lanv99lsd5nq0s3h761hs3m.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

}