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
    apiKey: 'AIzaSyB47qSGy82gUOC8Vx_e4TKg3-ZHNoNJLu4',
    appId: '1:835835222811:web:7a2023e263febe032291be',
    messagingSenderId: '835835222811',
    projectId: 'germanproduct',
    authDomain: 'germanproduct.firebaseapp.com',
    storageBucket: 'germanproduct.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCer_Of9cbihAFQ03MUunJm6Z1qzSYzyVc',
    appId: '1:835835222811:android:7f6d9073236ff9b62291be',
    messagingSenderId: '835835222811',
    projectId: 'germanproduct',
    storageBucket: 'germanproduct.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwb84N1S8yO9ltz-rwptpiaLEAcvAmB-M',
    appId: '1:835835222811:ios:ed15ad47e6d2332c2291be',
    messagingSenderId: '835835222811',
    projectId: 'germanproduct',
    storageBucket: 'germanproduct.appspot.com',
    iosBundleId: 'com.example.germanManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwb84N1S8yO9ltz-rwptpiaLEAcvAmB-M',
    appId: '1:835835222811:ios:a641b73788d2ec5a2291be',
    messagingSenderId: '835835222811',
    projectId: 'germanproduct',
    storageBucket: 'germanproduct.appspot.com',
    iosBundleId: 'com.example.germanManagementApp.RunnerTests',
  );
}
