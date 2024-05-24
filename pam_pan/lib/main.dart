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
client
    .setEndpoint('http://localhost/v1')
    .setProject('665039250035c9a58fe1')
    .setSelfSigned(status: true); // For self signed certificates, only use for development

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeName(),
    ),
  );
}
