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
    apiKey: 'AIzaSyCf4M6EHGRfEAC-A1GpyeqD2BAhEzcvMpM',
    appId: '1:1078761287185:web:7b5c2857f62791a0ff8bb0',
    messagingSenderId: '1078761287185',
    projectId: 'projecttasklist-7ade4',
    authDomain: 'projecttasklist-7ade4.firebaseapp.com',
    storageBucket: 'projecttasklist-7ade4.appspot.com',
    measurementId: 'G-BX87GBGVHR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmr2BvO6T5OtJtt4kxDPb_Rz0azPMjs0A',
    appId: '1:1078761287185:android:5393f02b176a85efff8bb0',
    messagingSenderId: '1078761287185',
    projectId: 'projecttasklist-7ade4',
    storageBucket: 'projecttasklist-7ade4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZPnxs-Ne37y4A4VKHS37fsOZICom1WAI',
    appId: '1:1078761287185:ios:45e71acea5ffd9a6ff8bb0',
    messagingSenderId: '1078761287185',
    projectId: 'projecttasklist-7ade4',
    storageBucket: 'projecttasklist-7ade4.appspot.com',
    iosBundleId: 'com.example.todoappflutter',
  );
}
