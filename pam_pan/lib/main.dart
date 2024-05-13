import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pam_pan/accountsetup/front_page.dart';
import 'package:pam_pan/accountsetup/libdb.dart';
import 'package:pam_pan/notifications/local_notifications.dart';

void main() async {
  // v-- might make the app take longer to load (needed to make sure the db can initialize)
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrontPage(),
    ),
  );
}
