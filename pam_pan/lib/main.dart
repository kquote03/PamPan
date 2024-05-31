import 'dart:async';
// import 'dart:js';..
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/ai/recipe_page.dart';
import 'package:pam_pan/connection_error.dart';
import 'package:pam_pan/firebase_ai.dart';
import 'package:pam_pan/login%20and%20signup/login.dart';
// Old SQLite-based local database
//import 'package:pam_pan/backend/libdb.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/welcome/welcome_name.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:appwrite/appwrite.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:firebase_core/firebase_core.dart';

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
          e.toString(),
    );
  }
// Example user for appwrite
  //await account
  //    .createEmailPasswordSession(
  //        email: "email@example.com", password: "password123")
  //    .timeout(const Duration(seconds: 10));

  //var result = await account.get();
  //print("Currently signed in as: " + (result?.email ?? "error"));

  try {
    final user = await account.get();
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RecipePage(),
      ),
    );
  } catch (e) {
    runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
