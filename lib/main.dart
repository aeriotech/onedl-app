import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fundl_app/config/services/config.service.dart';
import 'package:fundl_app/firebase/services/firebase_messaging.service.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(
    FirebaseMessagingService.backgroundHandler,
  );

  await ConfigService.init();
  await FirebaseMessagingService.init();

  runApp(const App());
}
