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
        return macos;
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
    apiKey: 'AIzaSyAkccfPf6SCo2Suau5b7EUi7iaUDRtAHBM',
    appId: '1:293477612420:web:c72190099a1e3f8ba0fbd1',
    messagingSenderId: '293477612420',
    projectId: 'icanto-c57bd',
    authDomain: 'icanto-c57bd.firebaseapp.com',
    storageBucket: 'icanto-c57bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcCLBnUZ66BpInGUV5lvtH3QQFntgGFB8',
    appId: '1:293477612420:android:4a424b002dd53d79a0fbd1',
    messagingSenderId: '293477612420',
    projectId: 'icanto-c57bd',
    storageBucket: 'icanto-c57bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnCxJu-6XxQsvy-JMFpcAWTIWNcEh3A70',
    appId: '1:293477612420:ios:e2379d9a9cb27b69a0fbd1',
    messagingSenderId: '293477612420',
    projectId: 'icanto-c57bd',
    storageBucket: 'icanto-c57bd.appspot.com',
    iosBundleId: 'com.example.icanTo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnCxJu-6XxQsvy-JMFpcAWTIWNcEh3A70',
    appId: '1:293477612420:ios:e2379d9a9cb27b69a0fbd1',
    messagingSenderId: '293477612420',
    projectId: 'icanto-c57bd',
    storageBucket: 'icanto-c57bd.appspot.com',
    iosBundleId: 'com.example.icanTo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAkccfPf6SCo2Suau5b7EUi7iaUDRtAHBM',
    appId: '1:293477612420:web:a080774315208f53a0fbd1',
    messagingSenderId: '293477612420',
    projectId: 'icanto-c57bd',
    authDomain: 'icanto-c57bd.firebaseapp.com',
    storageBucket: 'icanto-c57bd.appspot.com',
  );
}