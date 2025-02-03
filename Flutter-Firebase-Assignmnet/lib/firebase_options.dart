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
        return windows;
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
    apiKey: 'AIzaSyCzIrvgZXEC9YNT-S58Tjs_TS8jj_qXnO8',
    appId: '1:116989232405:web:1939b2f0a63bc5613e951c',
    messagingSenderId: '116989232405',
    projectId: 'fir-first-project-201f4',
    authDomain: 'fir-first-project-201f4.firebaseapp.com',
    storageBucket: 'fir-first-project-201f4.firebasestorage.app',
    measurementId: 'G-GXMT5QVRL8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAShoIl0BXyGJR_ZAOcLIAHKPJJfoqMgnQ',
    appId: '1:116989232405:android:8ad7b5b7edf7ada93e951c',
    messagingSenderId: '116989232405',
    projectId: 'fir-first-project-201f4',
    storageBucket: 'fir-first-project-201f4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7U5cEs6L6zb6J5IgOBR5i9_0k0ePsuqQ',
    appId: '1:116989232405:ios:fca8cc1895210bc23e951c',
    messagingSenderId: '116989232405',
    projectId: 'fir-first-project-201f4',
    storageBucket: 'fir-first-project-201f4.firebasestorage.app',
    iosBundleId: 'com.example.flutterAssignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCzIrvgZXEC9YNT-S58Tjs_TS8jj_qXnO8',
    appId: '1:116989232405:web:76b329bfc662e56a3e951c',
    messagingSenderId: '116989232405',
    projectId: 'fir-first-project-201f4',
    authDomain: 'fir-first-project-201f4.firebaseapp.com',
    storageBucket: 'fir-first-project-201f4.firebasestorage.app',
    measurementId: 'G-LR7ESEQQJ0',
  );
}
