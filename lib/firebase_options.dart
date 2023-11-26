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
    apiKey: 'AIzaSyCgzBVHVGmKItFbBhHFnpmS9gG_OnUfum8',
    appId: '1:561823717277:web:fbbfdb2ffa4b611425c174',
    messagingSenderId: '561823717277',
    projectId: 'weather-87e54',
    authDomain: 'weather-87e54.firebaseapp.com',
    storageBucket: 'weather-87e54.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6jLecR7ozaBEBou6_EEf_Mmdkitq9KVE',
    appId: '1:561823717277:android:94e05279973ce20e25c174',
    messagingSenderId: '561823717277',
    projectId: 'weather-87e54',
    storageBucket: 'weather-87e54.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBU8-iYksEE9j2hUz56gRnIDrasqe5JkV8',
    appId: '1:561823717277:ios:e8823011433b136125c174',
    messagingSenderId: '561823717277',
    projectId: 'weather-87e54',
    storageBucket: 'weather-87e54.appspot.com',
    iosBundleId: 'com.example.weatherApp',
  );
}