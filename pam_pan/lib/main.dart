import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/accountsetup/libdb.dart';
import 'package:pam_pan/page_skeleton.dart';

void main() async {
  // v-- might make the app take longer to load (needed to make sure the db can initialize)
  WidgetsFlutterBinding.ensureInitialized();
  final db = LibDB().initializeDB();
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
  runApp(const PageSkeleton());
}
