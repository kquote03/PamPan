import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pam_pan/profile/profile_page.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/notifications/notifications_page.dart';
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

class _HomePageState extends State<HomePage> {
  String appGroupId = 'group.pampan';
  String iOSWidgetName = 'pampan';
  int index = 0;
  List<Color> colours = [
    const Color.fromARGB(255, 197, 234, 250),
    const Color(0xFFA2CFFE),
    const Color(0xFF9DD9F3),
  ];
  Random random = Random();
  int _current = 0;
  final CarouselController _controller = CarouselController();
  // List<String> carousel1Text
  List<Widget>? carousel1 = [1, 2, 3].map(
    (i) {
      return Builder(
        builder: (BuildContext context) {
          return SizedBox(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 197, 234, 250),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(10, 10),
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
              child: Text(
                'text $i',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          );
        },
      );
    },
  ).toList();

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
            onPressed: () {},
          ),
          // IconButton(
          //   icon:
          //       const Icon(Icons.notifications, size: 35, color: Colors.black),
          //   onPressed: () {
          //     LocalNotifications.showSimpleNotification(
          //       title: "Simple title",
          //       body: "Simple body",
          //       payload: "Simple payload",
          //     );
          //   },
          // ),
          // IconButton(
          //   icon:
          //       const Icon(Icons.notifications, size: 35, color: Colors.black),
          //   onPressed: () {
          //     String randomTip = Tips.tips[random.nextInt(Tips.tips.length)][0];
          //     LocalNotifications.showPeriodicNotification(
          //       title: "Pam got some tips for you!",
          //       body: randomTip,
          //       payload: randomTip,
          //     );
          //   },
          // ),
          // IconButton(
          //   icon: const Icon(Icons.cancel, size: 35, color: Colors.black),
          //   onPressed: () {
          //     LocalNotifications.cancelAll();
          //   },
          // ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  // height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.95,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  // autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _current = index;
                      },
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
                items: carousel1),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: carousel1!.map((entry) {
            //     return GestureDetector(
            //       onTap: () => _controller.animateToPage(entry),
            //       child: Container(
            //         width: 12.0,
            //         height: 12.0,
            //         margin: const EdgeInsets.symmetric(
            //             vertical: 8.0, horizontal: 4.0),
            //         decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: (Theme.of(context).brightness == Brightness.dark
            //                     ? Colors.white
            //                     : Colors.black)
            //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            //       ),
            //     );
            //   }).toList(),
            // ),

            // Column(
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.all(8.0),
            //     ),
            //     Container(
            //       padding: const EdgeInsets.all(8),
            //       child: const SizedBox(
            //         height: 600,
            //         child: DecoratedBox(
            //           decoration: const BoxDecoration(
            //               color: Color.fromARGB(103, 93, 51, 16)),
            //           child: Center(
            //             child: Scrollbar(
            //               trackVisibility: true,
            //               thumbVisibility: true,
            //               scrollbarOrientation: ScrollbarOrientation.left,
            //               child: GridView.count(
            //                 crossAxisCount: 4,
            //                 // mainAxisSpacing: 7,
            //                 // crossAxisSpacing:5,
            //                 scrollDirection: Axis.horizontal,
            //                 childAspectRatio: 1.4,
            //                 // children: List.generate(
            //                   // categories.length,
            //                   (index) {
            //                     return Container(
            //                       decoration: const BoxDecoration(
            //                           // border: Border.all(
            //                           //   // width: 3,
            //                           //   color: Colors.black,
            //                           // ),
            //                           ),
            //                       child: Center(
            //                         child: GestureDetector(
            //                           onTap: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                 builder: (context) {
            //                                   return ItemListPage(
            //                                       categories[index]
            //                                           .nameString);
            //                                 },
            //                               ),
            //                             );
            //                           },
            //                           child: Column(
            //                             children: [
            //                               SizedBox(
            //                                 height: MediaQuery.of(context)
            //                                         .size
            //                                         .height *
            //                                     0.02,
            //                               ),
            //                               categories[index].icon,
            //                               Text(
            //                                 categories[index].nameString,
            //                                 style: const TextStyle(
            //                                   fontSize: 15,
            //                                 ),
            //                                 textAlign: TextAlign.center,
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 1500,
            ),
            const Text("yo"),
            ElevatedButton(
              onPressed: () => updateWidgetFun(),
              child: const Text('Update'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
