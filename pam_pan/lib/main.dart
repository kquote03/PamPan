import 'dart:async';
// import 'dart:js';..
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/connection_error.dart';
import 'package:pam_pan/firebase_ai.dart';
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
            e.toString());
  }
// Example user for appwrite
  try {
    /*
    print(await FirebaseAI().twoImagesTextWithoutStream("""
      Only reply back with a properly formatted JSON response. starting with a curly brace immediately.
      Fill the following JSON structure with data extracted from the image.

      {
      "itemName": "",
      "expriyDate": "",
      "category": "",
      "quanitityUnit": ""
      }

      Where itemName is the name (or brand) of the food item being scanned, the
      expiryDate is the expiry date of the food item from the image(s) and it is in the strict format of YYYY-MM-DD,
      the category is just the one-word category of the food (for example a bag of lays is categorized as snacks),
      and quantityUnit is the unit of measurement, for this please only pick one from ['g', 'kg', 'l', 'ml', 'pieces']
      """, '/sdcard/Download/waterimages/water1.jpg', 'image/jpeg',
        '/sdcard/Download/waterimages/water2.jpg', 'image/jpeg'));
*/
    account.deleteSession(sessionId: 'current');
    await account
        .createEmailPasswordSession(
            email: "email@example.com", password: "password123")
        .timeout(const Duration(seconds: 10));

    var result = await account.get();
    print("Currently signed in as: " + (result?.email ?? "error"));

    runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  } on AppwriteException catch (e) {
    print(e);
    if (!e.toString().contains("user_session_already_exists"))
      runApp(const MaterialApp(home: ConnectionError()));
  }
  final model = FirebaseVertexAI.instance
      .generativeModel(model: 'gemini-1.5-flash-preview-0514');

  // final prompt = [Content.text('Write a story about a magic backpack.')];
  // final response = await model.generateContent(prompt);
  // print(response.text);

  // runApp(
  //   const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: WelcomeName(),
  //   ),
  // );
}
