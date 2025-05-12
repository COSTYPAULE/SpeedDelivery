import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart' as firebase_options;

/// Initializes the Firebase config based on the environment.
Future<void> initializeFirebaseApp() async {
  await Firebase.initializeApp(
     options: firebase_options.DefaultFirebaseOptions.currentPlatform,
  );
}
