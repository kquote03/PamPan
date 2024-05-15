import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';
import 'package:pam_pan/notifications/expiry_test.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/notifications/notifications_page.dart';
import 'package:pam_pan/notifications/tips.dart';

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
  Random random = Random();

  @override
  void initState() {
    listenNotifications();
    super.initState();
    currentPage = ButtonContentsManager.buttonContents[0];
  }

  listenNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen(
      (event) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationsPage(payload: event),
          ),
        );
      },
    );
  }

  void buttonClicked() {
    setState(() {
      currentPage = ButtonContentsManager.buttonContents[index];
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 250, 240),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 250, 240),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ButtonContentsManager.buttonContents[7];
                    },
                  ),
                );
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
                        return ButtonContentsManager.buttonContents[10];
                      },
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications,
                    size: 35, color: Colors.black),
                onPressed: () {
                  LocalNotifications.showSimpleNotification(
                    title: "Simple title",
                    body: "Simple body",
                    payload: "Simple payload",
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications,
                    size: 35, color: Colors.black),
                onPressed: () {
                  String randomTip =
                      Tips.tips[random.nextInt(Tips.tips.length)][0];
                  LocalNotifications.showPeriodicNotification(
                    title: "Pam got some tips for you!",
                    body: randomTip,
                    payload: randomTip,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.cancel, size: 35, color: Colors.black),
                onPressed: () {
                  LocalNotifications.cancelAll();
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications,
                    size: 35, color: Colors.black),
                onPressed: () {
                  ExpiryTest.sortList(ExpiryTest.items);
                  for (int i = 0; i < ExpiryTest.items.length; i++) {
                    LocalNotifications.showScheduleNotification(
                      id: i,
                      title:
                          "Uhoh! ${ExpiryTest.items[i][1]} is about to expire!",
                      body:
                          "Quick! It will expire on ${ExpiryTest.items[i][0]}",
                      payload: "Scheduled payload",
                      minutes: ExpiryTest.daysBetween(DateTime.now(),
                          ExpiryTest.stringToDate(ExpiryTest.items[i][0])),
                    );
                  }
                },
              ),
              // IconButton(
              //   icon: const Icon(Icons.notifications,
              //       size: 35, color: Colors.black),
              //   onPressed: () {
              //     for (int i = 1; i < 5; i++) {
              //       LocalNotifications.showScheduleNotification(
              //         id: i,
              //         title: "Scheduled title",
              //         body: "Scheduled body",
              //         payload: "Scheduled payload",
              //         minutes: i,
              //       );
              //     }
              //   },
              // ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                currentPage,
                const SizedBox(
                  height: 1500,
                  child: Placeholder(),
                ),
                const Text("yo"),
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            backgroundColor: const Color.fromARGB(255, 255, 250, 240),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ButtonContentsManager.buttonContents[11];
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.location_on,
                        size: 35, color: Colors.black),
                  ),
                  label: 'Map'),
              NavigationDestination(
                  icon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ButtonContentsManager.buttonContents[9];
                          },
                        ),
                      );
                    },
                    icon: const Icon(Clarity.plus_circle_solid,
                        size: 35, color: Colors.black),
                  ),
                  label: 'Camera'),
              NavigationDestination(
                  icon: IconButton(
                    icon: const Icon(Icons.notifications,
                        size: 35, color: Colors.black),
                    onPressed: () {
                      LocalNotifications.showSimpleNotification(
                        title: "Simple title",
                        body: "Simple body",
                        payload: "Simple payload",
                      );
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
