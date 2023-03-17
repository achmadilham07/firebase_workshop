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
    apiKey: 'AIzaSyBzMnWQLfIHjCjFcbX57KKUSi9fbFEZB5w',
    appId: '1:915057572437:web:23b4e8c0c0ffaa71e3b2dc',
    messagingSenderId: '915057572437',
    projectId: 'my-chat-app-belajarubic',
    authDomain: 'my-chat-app-belajarubic.firebaseapp.com',
    storageBucket: 'my-chat-app-belajarubic.appspot.com',
    measurementId: 'G-E4XDX3ZZSR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCO8mLAO0IErri4SItAasIppyz6fCvoFIo',
    appId: '1:915057572437:android:0a2a2b8a944a7820e3b2dc',
    messagingSenderId: '915057572437',
    projectId: 'my-chat-app-belajarubic',
    storageBucket: 'my-chat-app-belajarubic.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRsbunnQC3upzCk5ssPikhSw2FqVJo1t8',
    appId: '1:915057572437:ios:dc3cf4277c6b0336e3b2dc',
    messagingSenderId: '915057572437',
    projectId: 'my-chat-app-belajarubic',
    storageBucket: 'my-chat-app-belajarubic.appspot.com',
    iosClientId: '915057572437-3ug51cqh87bld6rue1hssn5ld9jlq032.apps.googleusercontent.com',
    iosBundleId: 'com.belajarubic.workshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRsbunnQC3upzCk5ssPikhSw2FqVJo1t8',
    appId: '1:915057572437:ios:dc3cf4277c6b0336e3b2dc',
    messagingSenderId: '915057572437',
    projectId: 'my-chat-app-belajarubic',
    storageBucket: 'my-chat-app-belajarubic.appspot.com',
    iosClientId: '915057572437-3ug51cqh87bld6rue1hssn5ld9jlq032.apps.googleusercontent.com',
    iosBundleId: 'com.belajarubic.workshop',
  );
}