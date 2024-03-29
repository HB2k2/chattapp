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
    apiKey: 'AIzaSyAgUv5zLSAu0R9_YGcq54g6C3C0eYvdOTQ',
    appId: '1:67007839951:web:ca4ea4d4437561b9abc1ba',
    messagingSenderId: '67007839951',
    projectId: 'chattapp-6b344',
    authDomain: 'chattapp-6b344.firebaseapp.com',
    storageBucket: 'chattapp-6b344.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTwYwfvHeKahY3ZEzz9DzbrI_v1vU_PNM',
    appId: '1:67007839951:android:b3f14c6915612865abc1ba',
    messagingSenderId: '67007839951',
    projectId: 'chattapp-6b344',
    storageBucket: 'chattapp-6b344.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZar43BEUxXx59bT89T9LdTFPbGT7mWTw',
    appId: '1:67007839951:ios:11e8468f0890792babc1ba',
    messagingSenderId: '67007839951',
    projectId: 'chattapp-6b344',
    storageBucket: 'chattapp-6b344.appspot.com',
    iosBundleId: 'com.example.chattapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZar43BEUxXx59bT89T9LdTFPbGT7mWTw',
    appId: '1:67007839951:ios:2cc298020d9e92a4abc1ba',
    messagingSenderId: '67007839951',
    projectId: 'chattapp-6b344',
    storageBucket: 'chattapp-6b344.appspot.com',
    iosBundleId: 'com.example.chattapp.RunnerTests',
  );
}
