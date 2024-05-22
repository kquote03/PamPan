import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:pam_pan/MiriamMap/miriam_map.dart';
import 'package:pam_pan/calendar/calendar.dart';
import 'package:pam_pan/map_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/pantry/category.dart';
import 'package:pam_pan/pantry/items_list_page.dart';
import 'package:pam_pan/profile/profile_page.dart';
import 'package:pam_pan/records.dart';
import 'package:pam_pan/notifications/expiry_test.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/notifications/notifications_page.dart';
import 'package:pam_pan/notifications/tips.dart';
import 'package:home_widget/home_widget.dart';

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
    super.initState();
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

  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

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
                icon: const Icon(Icons.calendar_month,
                    size: 30, color: Colors.black),
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
                  ExpiryTest.sortList(items);
                  for (int i = 0; i < items.length; i++) {
                    LocalNotifications.showScheduleNotification(
                      id: i,
                      title: "Uhoh! ${items[i][1]} is about to expire!",
                      body: "Quick! It will expire on ${items[i][0]}",
                      payload: "Scheduled payload",
                      minutes: ExpiryTest.daysBetween(
                          DateTime.now(), ExpiryTest.stringToDate(items[i][0])),
                    );
                  }
                },
              ),
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
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.7,
                  //   width: MediaQuery.of(context).size.width * 0.7,
                  //   child: GoogleMap(
                  //     mapType: MapType.hybrid,
                  //     initialCameraPosition: _kGooglePlex,
                  //     onMapCreated: (GoogleMapController controller) {
                  //       _controller.complete(controller);
                  //     },
                  //   ),
                  // ),
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
          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: _goToTheLake,
          //   label: const Text('To the lake!'),
          //   icon: const Icon(Icons.directions_boat),
          // ),
          bottomNavigationBar: NavigationBar(
            backgroundColor: const Color.fromARGB(255, 255, 250, 240),
            destinations: [
              NavigationDestination(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MapPage();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.location_on,
                      size: 35, color: Colors.black),
                ),
                label: 'Map',
              ),
              NavigationDestination(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AddItemPage();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Clarity.plus_circle_solid,
                      size: 35, color: Colors.black),
                ),
                label: 'Camera',
              ),
              NavigationDestination(
                icon: IconButton(
                  icon: const Icon(
                    Icons.receipt,
                    size: 35,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Records();
                        },
                      ),
                    );
                  },
                ),
                label: 'Records',
              ),
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

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(
  //     CameraUpdate.newCameraPosition(_kLake),
  //   );
  // }
}
