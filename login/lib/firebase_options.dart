// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyCpwkHLbTXhrjEAbftbORVkoHLOpxFb1ug',
    appId: '1:103069901085:web:cca1b43873c1b2dbec01f4',
    messagingSenderId: '103069901085',
    projectId: 'loginpage-158b8',
    authDomain: 'loginpage-158b8.firebaseapp.com',
    databaseURL: 'https://loginpage-158b8-default-rtdb.firebaseio.com',
    storageBucket: 'loginpage-158b8.appspot.com',
    measurementId: 'G-WV7C64MK02',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwv2j1GC8ssKQZXstzsKLfYKyeCRfVUFE',
    appId: '1:103069901085:android:5705694139d468d5ec01f4',
    messagingSenderId: '103069901085',
    projectId: 'loginpage-158b8',
    databaseURL: 'https://loginpage-158b8-default-rtdb.firebaseio.com',
    storageBucket: 'loginpage-158b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfa_L0d9Th7ecVm6zrbzDZms1Ad-uB7QY',
    appId: '1:103069901085:ios:7fa5d011bf8dae6eec01f4',
    messagingSenderId: '103069901085',
    projectId: 'loginpage-158b8',
    databaseURL: 'https://loginpage-158b8-default-rtdb.firebaseio.com',
    storageBucket: 'loginpage-158b8.appspot.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfa_L0d9Th7ecVm6zrbzDZms1Ad-uB7QY',
    appId: '1:103069901085:ios:d359ba1e2121485eec01f4',
    messagingSenderId: '103069901085',
    projectId: 'loginpage-158b8',
    databaseURL: 'https://loginpage-158b8-default-rtdb.firebaseio.com',
    storageBucket: 'loginpage-158b8.appspot.com',
    iosBundleId: 'com.example.login.RunnerTests',
  );
}
