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
    apiKey: 'AIzaSyCWNU8Cx_yOTeSp0HowmoZiBWNjmKGivH8',
    appId: '1:382190646327:web:17bd38f644326376557bb2',
    messagingSenderId: '382190646327',
    projectId: 'proyectoapp-efc11',
    authDomain: 'proyectoapp-efc11.firebaseapp.com',
    storageBucket: 'proyectoapp-efc11.firebasestorage.app',
    measurementId: 'G-00NBPPMSXS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDpKr8nphTdFfNAoeSE7B9MYJFqZ9jwXg',
    appId: '1:382190646327:android:fca0e9e0397e6842557bb2',
    messagingSenderId: '382190646327',
    projectId: 'proyectoapp-efc11',
    storageBucket: 'proyectoapp-efc11.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgq9cA70KXXNP4Q5Rx260FZm-rhrQjnP0',
    appId: '1:382190646327:ios:344a0395f385ab53557bb2',
    messagingSenderId: '382190646327',
    projectId: 'proyectoapp-efc11',
    storageBucket: 'proyectoapp-efc11.firebasestorage.app',
    iosBundleId: 'com.example.proyecto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgq9cA70KXXNP4Q5Rx260FZm-rhrQjnP0',
    appId: '1:382190646327:ios:344a0395f385ab53557bb2',
    messagingSenderId: '382190646327',
    projectId: 'proyectoapp-efc11',
    storageBucket: 'proyectoapp-efc11.firebasestorage.app',
    iosBundleId: 'com.example.proyecto',
  );
}
