import 'package:flutter/material.dart';
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
      home: Scaffold(
          appBar: AppBar(
            title: Text(ButtonContentsManager.pageLabels[index]),
            leading: IconButton(
              icon: const Icon(Icons.help),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: () {
                  index = 2;
                  // change index from 2-7 to access the diff calendar pages, look at ButtonContentsManager for more info
                  buttonClicked();
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                    icon: const Icon(
                      Icons.home,
                      size: 35,
                    )),
                label: 'Home',
              ),
              NavigationDestination(
                  icon: IconButton(
                    onPressed: () {
                      index = 1;
                      buttonClicked();
                    },
                    icon: const Icon(
                      Icons.map,
                      size: 35,
                    ),
                  ),
                  label: 'Map'),
              NavigationDestination(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt, size: 35),
                  ),
                  label: 'Camera'),
              NavigationDestination(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    size: 35,
                  ),
                ),
                label: 'Profile',
              ),
            ],
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: 70,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            indicatorColor: const Color.fromARGB(27, 187, 48, 48),
          )),
    );
  }
}
