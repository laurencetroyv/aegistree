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
    apiKey: 'AIzaSyCxlOXi3CHxgqT_lhM8D3XxkcVa26x2wwA',
    appId: '1:916388646081:web:28b688a34b32a2e6d99840',
    messagingSenderId: '916388646081',
    projectId: 'tree-leaf-detection',
    authDomain: 'tree-leaf-detection.firebaseapp.com',
    storageBucket: 'tree-leaf-detection.appspot.com',
    measurementId: 'G-HHXPNCZVC3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwsoiuDj-9zgvAeg_4WPiMdnTVoCpxd9Q',
    appId: '1:916388646081:android:ea081cb336f24bf3d99840',
    messagingSenderId: '916388646081',
    projectId: 'tree-leaf-detection',
    storageBucket: 'tree-leaf-detection.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsOU76yklbZqnVcJ0Xo6pjxNdRjToNJwU',
    appId: '1:916388646081:ios:ef5120c17ae48cbfd99840',
    messagingSenderId: '916388646081',
    projectId: 'tree-leaf-detection',
    storageBucket: 'tree-leaf-detection.appspot.com',
    iosBundleId: 'com.example.aegistree',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsOU76yklbZqnVcJ0Xo6pjxNdRjToNJwU',
    appId: '1:916388646081:ios:ef5120c17ae48cbfd99840',
    messagingSenderId: '916388646081',
    projectId: 'tree-leaf-detection',
    storageBucket: 'tree-leaf-detection.appspot.com',
    iosBundleId: 'com.example.aegistree',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCxlOXi3CHxgqT_lhM8D3XxkcVa26x2wwA',
    appId: '1:916388646081:web:e66fab9f6b1a2620d99840',
    messagingSenderId: '916388646081',
    projectId: 'tree-leaf-detection',
    authDomain: 'tree-leaf-detection.firebaseapp.com',
    storageBucket: 'tree-leaf-detection.appspot.com',
    measurementId: 'G-DPFZGQ1FXJ',
  );

}