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
    currentPage = LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child: const Center(
                  child: Text('Mini calendar widget - incomplete'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: const Center(
                    child: Text(
                        'Pam and buttons and the pantry - incomplete - is clickable and will take you to the full pantry page'),
                  ),
                ),
              ),
            ),
          ],
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
      home: Scaffold(
          appBar: AppBar(
            title: const Text("PAM'S PANTRY!"),
            leading: IconButton(
              icon: const Icon(Icons.help),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: () {
                  index = 1;
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
                      index = 2;
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
                    onPressed: () {
                      index = 3;
                      buttonClicked();
                    },
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
