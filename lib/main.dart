import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:modul3prak/app/modules/home/controllers/notif_handler.dart';
import 'package:modul3prak/app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Initialize Firebase Cloud Messaging
  await messaging.requestPermission();

  // Get the FCM token
  String? token = await messaging.getToken();
  print("FCM Token: $token");

  runApp(
    GetMaterialApp(
        title: "Application",
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesClass.getHomeRoute(),
        getPages: RoutesClass.routes),
  );
}
