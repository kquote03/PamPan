import 'package:flutter/material.dart';
import 'package:pam_pan/local_notifications.dart';
import 'package:pam_pan/page_skeleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  runApp(const PageSkeleton());
}
