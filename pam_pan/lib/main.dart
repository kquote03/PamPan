import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pam_pan/accountsetup/front_page.dart';
import 'package:pam_pan/accountsetup/libdb.dart';
import 'package:pam_pan/payment_page.dart';

void main() async {
  // v-- might make the app take longer to load (needed to make sure the db can initialize)
  WidgetsFlutterBinding.ensureInitialized();
  final db = LibDB().initializeDB();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
      context as BuildContext,
      MaterialPageRoute<void>(builder: (context) => const PaymentPage()),
    );
  }

  final StreamController<ReceivedNotification>
      didReceiveLocalNotificationStream =
      StreamController<ReceivedNotification>.broadcast();

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('pampan_logo_android.png');
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) async {
      didReceiveLocalNotificationStream.add(
        ReceivedNotification(
          id: id,
          title: title,
          body: body,
          payload: payload,
        ),
      );
    },
  );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrontPage(),
    ),
  );
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
