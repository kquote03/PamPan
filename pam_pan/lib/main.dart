// ignore_for_file: unused_import

import 'dart:async';
// import 'dart:js';..

import 'package:flutter/material.dart';
import 'package:pam_pan/database/libdb.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/welcome/welcome_name.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
