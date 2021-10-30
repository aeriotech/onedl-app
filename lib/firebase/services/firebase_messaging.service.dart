import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fundl_app/config/services/config.service.dart';

class FirebaseMessagingService {
  static Future<void> init() async {
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: false,
    );

    final configService = ConfigService.instance;

    final token = await messaging.getToken(
      vapidKey: configService.config.vapidKey,
    );

    print('FCM Token: $token');

    FirebaseMessaging.onMessage.listen((message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();

    print('Handling a background message: ${message.messageId}');
  }
}
