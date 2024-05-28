import 'dart:async';
// import 'dart:js';..

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
// Old SQLite-based local database
//import 'package:pam_pan/backend/libdb.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/welcome/welcome_name.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:appwrite/appwrite.dart';
import 'package:pam_pan/backend/appwrite_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print(
        "Firebase Initialization Failed. AI-features will NOT work. Here's why:\n" +
            e.toString());
  }
// Example user for appwrite
  try {
    //account.deleteSession(sessionId: 'current');
    await account.createEmailPasswordSession(
        email: "email@example.com", password: "password123");
  } on Exception catch (e) {
    print(e);
  }
  User result = await account.get();
  print("Currently signed in as: " + result.email);

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
