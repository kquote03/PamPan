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
      color: const Color.fromARGB(255, 255, 255, 255),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(ButtonContentsManager.pageLabels[index]),
            leading: IconButton(
              icon: const Icon(Icons.help, size: 30, color: Colors.black),
              onPressed: () {},
            ),
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
            backgroundColor: const Color.fromARGB(255, 255, 254, 254),
          ),
          body: currentPage,
          floatingActionButton: FloatingActionButton.large(
            onPressed: () {
              index = 8;
              buttonClicked();
            },
            elevation: 0,
            // isExtended: true,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: const CircleBorder(),
            child: IconButton(
              onPressed: () {
                index = 8;
                buttonClicked();
              },
              icon: const Icon(Clarity.plus_circle_solid,
                  size: 55, color: Colors.black),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                    icon: const Icon(Icons.camera_alt,
                        size: 1, color: Color.fromARGB(0, 0, 0, 0)),
                  ),
                  label: 'Map'),
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
              NavigationDestination(
                icon: IconButton(
                  onPressed: () {
                    index = 7;
                    buttonClicked();
                  },
                  icon: const Icon(Icons.person, size: 35, color: Colors.black),
                ),
                label: 'Profile',
              ),
            ],
            backgroundColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: 70,
            // onDestinationSelected: (value) {},
            selectedIndex: 0,
            surfaceTintColor: Colors.white,
            indicatorColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
