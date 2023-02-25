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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAzEsXqiX-QqirN0ZpnmugUxaX7ctD8hYc',
    appId: '1:982829791227:web:3a497120c24c2d5b10bd5e',
    messagingSenderId: '982829791227',
    projectId: 'project-3-157f0',
    authDomain: 'project-3-157f0.firebaseapp.com',
    storageBucket: 'project-3-157f0.appspot.com',
    measurementId: 'G-ZNVPGNKMEE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPSAIK7irpWFdKZ1-xOTlJDPdn3rp1nu8',
    appId: '1:982829791227:android:2b0f8dac6ea0f96b10bd5e',
    messagingSenderId: '982829791227',
    projectId: 'project-3-157f0',
    storageBucket: 'project-3-157f0.appspot.com',
  );
}