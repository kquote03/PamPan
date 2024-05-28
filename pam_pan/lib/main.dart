// ignore_for_file: unused_import

import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
// Old SQLite-based local database
//import 'package:pam_pan/backend/libdb.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/welcome/welcome_name.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appwrite/appwrite.dart';
import 'package:pam_pan/backend/appwrite_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeName(),
    ),
  );
}
