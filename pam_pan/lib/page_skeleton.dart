import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';
import 'package:pam_pan/notifications/notification_controller.dart';

class PageSkeleton extends StatefulWidget {
  const PageSkeleton({super.key});

  @override
  State<PageSkeleton> createState() {
    return _PageSkeleton();
  }
}

class _PageSkeleton extends State<PageSkeleton> {
  int index = 0;

  late Widget currentPage;

  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
    currentPage = ButtonContentsManager.buttonContents[0];
  }

  void buttonClicked() {
    setState(() {
      currentPage = ButtonContentsManager.buttonContents[index];
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      color: const Color.fromARGB(255, 255, 250, 240),
      theme: ThemeData(
          colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 255, 250, 240),
        secondary: Color.fromARGB(255, 255, 255, 255),
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: Color.fromARGB(255, 255, 250, 240),
        onBackground: Colors.black,
        surface: Color.fromARGB(255, 255, 250, 240),
        onSurface: Colors.black,
      )),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                index = 7;
                buttonClicked();
              },
              icon: const Icon(Icons.person, size: 35, color: Colors.black),
            ),
            title: Text(ButtonContentsManager.pageLabels[index]),
            actions: [
              Text(
                DateFormat.MMMM().format(DateTime.now()),
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month,
                    size: 30, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ButtonContentsManager.buttonContents[2];
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          body: currentPage,
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: IconButton(
                    onPressed: () {
                      index = 0;
                      buttonClicked();
                    },
                    icon:
                        const Icon(Icons.home, size: 35, color: Colors.black)),
                label: 'Home',
              ),
              NavigationDestination(
                  icon: IconButton(
                    onPressed: () {
                      index = 1;
                      buttonClicked();
                    },
                    icon: const Icon(Icons.location_on,
                        size: 35, color: Colors.black),
                  ),
                  label: 'Map'),
              NavigationDestination(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Clarity.plus_circle_solid,
                        size: 35, color: Colors.black),
                  ),
                  label: 'Camera'),
              NavigationDestination(
                  icon: IconButton(
                    icon: const Icon(Icons.notifications,
                        size: 35, color: Colors.black),
                    onPressed: () {
                      AwesomeNotifications().createNotification(
                          content: NotificationContent(
                        id: 1,
                        channelKey: "basic_channel",
                        title: "hello world",
                        body: "yay noti",
                      ));
                    },
                  ),
                  label: 'Notifications'),
            ],
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: 70,
            // onDestinationSelected: (value) {},
            selectedIndex: 0,
            surfaceTintColor: const Color.fromARGB(255, 255, 255, 242),
            indicatorColor: const Color.fromARGB(255, 255, 255, 242),
          ),
        ),
      ),
    );
  }
}
