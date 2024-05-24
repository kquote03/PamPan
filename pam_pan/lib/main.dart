import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pam_pan/database/libdb.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/welcome/welcome_name.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final model = FirebaseVertexAI.instance
      .generativeModel(model: 'gemini-1.5-flash-preview-0514');

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeName(),
    ),
  );
}
