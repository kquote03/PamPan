import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:pam_pan/calendar/calendar.dart';
import 'package:pam_pan/map_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:intl/intl.dart';
import 'package:pam_pan/calendar/calendar.dart';
import 'package:pam_pan/pantry/category.dart';
import 'package:pam_pan/pantry/items_list_page.dart';
import 'package:pam_pan/profile/profile_page.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/notifications/notifications_page.dart';
import 'package:pam_pan/notifications/tips.dart';
import 'package:home_widget/home_widget.dart';
import 'bottom_bar.dart';

//Taken from expiry_test
DateTime stringToDate(String date) {
  return DateTime.parse(date);
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

List<List<String>> sortList(List<List<String>> list) {
  list.sort((a, b) => a[0].compareTo(b[0]));
  return list;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

@override
State<HomePage> createState() {
  return _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appGroupId = 'group.pampan';
  String iOSWidgetName = 'pampan';
  int index = 0;

  late Widget currentPage;
  Random random = Random();

  @override
  void initState() {
    HomeWidget.setAppGroupId(appGroupId);
    super.initState();
    listenNotifications();
  }

  updateWidgetFun() {
    HomeWidget.saveWidgetData<String>('title', 'flutter');
    HomeWidget.saveWidgetData<String>('description', 'app dev');
    HomeWidget.updateWidget(iOSName: iOSWidgetName);
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

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ProfilePage();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.person,
            size: 35,
            color: Colors.black,
          ),
        ),
        actions: [
          Text(
            DateFormat.MMMM().format(DateTime.now()),
            style: const TextStyle(fontSize: 20),
          ),
          IconButton(
            icon:
                const Icon(Icons.calendar_month, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Calendar(2);
                  },
                ),
              );
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.notifications, size: 35, color: Colors.black),
            onPressed: () {
              LocalNotifications.showSimpleNotification(
                title: "Simple title",
                body: "Simple body",
                payload: "Simple payload",
              );
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.notifications, size: 35, color: Colors.black),
            onPressed: () {
              String randomTip = Tips.tips[random.nextInt(Tips.tips.length)][0];
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

          //TODO: Implement database below
          //IconButton(
          //  icon: const Icon(Icons.notifications,
          //      size: 35, color: Colors.black),
          //  onPressed: () {
          //    sortList(items);
          //    for (int i = 0; i < items.length; i++) {
          //      LocalNotifications.showScheduleNotification(
          //        id: i,
          //        title: "Uhoh! ${items[i][1]} is about to expire!",
          //        body: "Quick! It will expire on ${items[i][0]}",
          //        payload: "Scheduled payload",
          //        minutes: daysBetween(
          //            DateTime.now(), stringToDate(items[i][0])),
          //      );
          //    }
          //  },
          //),
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
      body: Scrollbar(
        interactive: true,
        thickness: 7,
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Calendar(1),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      height: 600,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(103, 93, 51, 16)),
                        child: Center(
                          child: Scrollbar(
                            // trackVisibility: true,
                            // thumbVisibility: true,
                            // scrollbarOrientation: ScrollbarOrientation.left,

                            child: GridView.count(
                              crossAxisCount: 4,
                              // mainAxisSpacing: 7,
                              // crossAxisSpacing:5,
                              scrollDirection: Axis.horizontal,
                              childAspectRatio: 1.4,
                              children: List.generate(
                                categories.length,
                                (index) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        // border: Border.all(
                                        //   // width: 3,
                                        //   color: Colors.black,
                                        // ),
                                        ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return ItemListPage(
                                                    categories[index]
                                                        .nameString);
                                              },
                                            ),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            categories[index].icon,
                                            Text(
                                              categories[index].nameString,
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 1500,
                child: Placeholder(),
              ),
              const Text("yo"),
              ElevatedButton(
                onPressed: () => updateWidgetFun(),
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
