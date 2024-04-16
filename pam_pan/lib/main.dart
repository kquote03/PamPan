import 'package:flutter/material.dart';
import 'package:pam_pan/accountsetup/libdb.dart';
import 'package:logger/logger.dart';
import 'package:pam_pan/accountsetup/front_page.dart';

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  // v-- might make the app take longer to load (needed to make sure the db can initialize)
  Logger.level = Level.debug;
  WidgetsFlutterBinding.ensureInitialized();
  final db = LibDB().initializeDB();
<<<<<<< HEAD
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelGroupKey: "basic_channel_group",
      channelKey: "basic_channel",
      channelName: "basic name",
      channelDescription: "basic desc",
    )
  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: "basic_channel_group",
      channelGroupName: "basic group",
    )
  ]);
  // bool isAllowedToSendNotifications =
  // await AwesomeNotifications().isNotificationAllowed();
  // if (!isAllowedToSendNotifications) {
  AwesomeNotifications().requestPermissionToSendNotifications();
  // }
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrontPage(),
    ),
  );
=======

  runApp(const PageSkeleton());
>>>>>>> e1cd7a4 (somebody once told me)
}
