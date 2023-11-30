import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  Future<void> _onMessage(RemoteMessage message) async {
    print("onMessage: $message");
  }

  Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    print("onMessageOpenedApp: $message");
  }

  Future<void> _onBackgroundMessage(RemoteMessage message) async {
    print("onBackgroundMessage: $message");
  }
}
