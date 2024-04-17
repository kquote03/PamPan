import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/accountsetup/libdb.dart';
import 'package:logger/logger.dart';
import 'package:pam_pan/accountsetup/sign_up.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login & Signup'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              LoginPage(),
              SingupPage(),
            ],
          ),
        ),
      ),
    );
  }
}

void main() async {
  // v-- might make the app take longer to load (needed to make sure the db can initialize)
  Logger.level = Level.debug;
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
  runApp(const MyApp());
}
