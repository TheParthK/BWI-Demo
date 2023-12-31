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
    apiKey: 'AIzaSyAORprrrbcbQBxD_3IWfZumNoMMLBRjFLo',
    appId: '1:789088210219:web:2fcdcb4a0a99b388e3496e',
    messagingSenderId: '789088210219',
    projectId: 'bwi-demo2',
    authDomain: 'bwi-demo2.firebaseapp.com',
    storageBucket: 'bwi-demo2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbuKXFdZ6VNpg9RcjXxweufNdlKnyMptY',
    appId: '1:789088210219:android:99e8f63a5dc98d2ce3496e',
    messagingSenderId: '789088210219',
    projectId: 'bwi-demo2',
    storageBucket: 'bwi-demo2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACdfSzZaqlc9vLZwizDIhCGoL0YllMqpE',
    appId: '1:789088210219:ios:9eb74541cedc53e5e3496e',
    messagingSenderId: '789088210219',
    projectId: 'bwi-demo2',
    storageBucket: 'bwi-demo2.appspot.com',
    iosBundleId: 'com.supitsparth.bwiDemo2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACdfSzZaqlc9vLZwizDIhCGoL0YllMqpE',
    appId: '1:789088210219:ios:1c4ddd2037f655c5e3496e',
    messagingSenderId: '789088210219',
    projectId: 'bwi-demo2',
    storageBucket: 'bwi-demo2.appspot.com',
    iosBundleId: 'com.example.bwiDemo2',
  );
}
