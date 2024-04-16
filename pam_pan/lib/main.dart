import 'package:flutter/material.dart';
import 'package:pam_pan/accountsetup/libdb.dart';
import 'package:pam_pan/page_skeleton.dart';

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  // v-- might make the app take longer to load (needed to make sure the db can initialize)
  WidgetsFlutterBinding.ensureInitialized();
  final db = LibDB().initializeDB();

  runApp(const PageSkeleton());
}
