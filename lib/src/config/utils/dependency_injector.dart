import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import 'firebase_options.dart';

late final FirebaseAnalytics analytics;
late final Reference storage;
late final FirebaseAuth auth;
late final FirebaseFirestore db;
late final Uuid uuid;
late final List<CameraDescription> cameras;

class DependencyInjector {
  static final DependencyInjector _singleton = DependencyInjector._internal();

  factory DependencyInjector() {
    return _singleton;
  }

  DependencyInjector._internal();

  Future<void> init() async {
    uuid = const Uuid();

    cameras = await availableCameras();

    // Initialize firebase
    await _firebase();
  }

  Future<void> _firebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    storage = FirebaseStorage.instance.ref();
    analytics = FirebaseAnalytics.instance;
    auth = FirebaseAuth.instance;
    db = FirebaseFirestore.instance;
  }
}
