import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';

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

  String currentMonth = DateFormat.MMMM().format(DateTime.now());

  @override
  void initState() {
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
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          title: Text(ButtonContentsManager.pageLabels[index]),
          leading: IconButton(
            icon: const Icon(Icons.help, size: 30, color: Colors.black),
            onPressed: () {},
          ),
          actions: [
            Text(
              currentMonth,
              style: const TextStyle(fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.calendar_month,
                  size: 30, color: Colors.black),
              onPressed: () {
                index = 2;
                // change index from 2-6 to access the diff calendar pages, look at ButtonContentsManager for more info
                buttonClicked();
              },
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: currentPage,
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {},
          elevation: 0,
          // isExtended: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: const CircleBorder(),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt, size: 55, color: Colors.black),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: IconButton(
                  onPressed: () {
                    index = 0;
                    buttonClicked();
                  },
                  icon: const Icon(Icons.home, size: 35, color: Colors.black)),
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
                  onPressed: () {},
                ),
                label: 'Notifications'),
            NavigationDestination(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, size: 35, color: Colors.black),
              ),
              label: 'Profile',
            ),
          ],
          // showSelectedLabels: false,
          backgroundColor: Colors.white,
          // enableFeedback: true,
          // type: BottomNavigationBarType.fixed

          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 70,
          // backgroundColor: const Color.fromARGB(255, 241, 247, 243),
          onDestinationSelected: (value) {},
          selectedIndex: 0,
          surfaceTintColor: null,
          indicatorColor: const Color.fromARGB(27, 187, 48, 48),
        ),
      ),
    );
  }
}



            // BottomAppBar(
            //   color: Colors.white,
            //   child: Row(
            //       mainAxisSize: MainAxisSize.max,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         IconButton(
            //             onPressed: () {
            //               index = 0;

            //               buttonClicked();
            //             },
            //             icon: const Icon(
            //               Icons.home,
            //               size: 40,
            //             )),
            //         IconButton(
            //           onPressed: () {
            //             index = 1;
            //             buttonClicked();
            //           },
            //           icon: const Icon(
            //             Icons.location_on,
            //             size: 40,
            //           ),
            //         ),
            //         IconButton(
            //           icon: const Icon(Icons.notifications, size: 40),
            //           onPressed: () {},
            //         ),
            //         IconButton(
            //           onPressed: () {},
            //           icon: const Icon(
            //             Icons.person,
            //             size: 40,
            //           ),
            //         ),
            //       ]),
            // ),