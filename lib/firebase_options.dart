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
    apiKey: 'AIzaSyD9z4gEAiJ747if2yM6lpal7Xj9g02VGQY',
    appId: '1:825393522087:web:86dcf2f146610eee7bc282',
    messagingSenderId: '825393522087',
    projectId: 'binarybandits-hnc',
    authDomain: 'binarybandits-hnc.firebaseapp.com',
    storageBucket: 'binarybandits-hnc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhC2dZUEUn_IP0YOJyZjhfWllCZ23Kb14',
    appId: '1:825393522087:android:274ff1bb69feff697bc282',
    messagingSenderId: '825393522087',
    projectId: 'binarybandits-hnc',
    storageBucket: 'binarybandits-hnc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5UQsgHSyEZ7TDMuJbgcsyBIe7n9fow6o',
    appId: '1:825393522087:ios:0d430c63e8df37c87bc282',
    messagingSenderId: '825393522087',
    projectId: 'binarybandits-hnc',
    storageBucket: 'binarybandits-hnc.appspot.com',
    iosBundleId: 'com.example.binaryBanditsHnc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5UQsgHSyEZ7TDMuJbgcsyBIe7n9fow6o',
    appId: '1:825393522087:ios:03acb9b008349ed47bc282',
    messagingSenderId: '825393522087',
    projectId: 'binarybandits-hnc',
    storageBucket: 'binarybandits-hnc.appspot.com',
    iosBundleId: 'com.example.binaryBanditsHnc.RunnerTests',
  );
}