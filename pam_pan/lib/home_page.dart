import 'package:flutter/material.dart';
import 'package:pam_pan/payment_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
            leading: _appBarButtonList[0],
            actions: [
              _appBarButtonList[1],
              _appBarButtonList[2],
            ],
            backgroundColor: const Color.fromARGB(255, 178, 94, 91),
          ),
          body: _navButtonContents[0](context),
          bottomNavigationBar: NavigationBar(
            destinations: _navButtonList,
          )),
    );
  }

  final List<NavigationDestination> _navButtonList = [
    // all the icons here are defaulted from flutter, we could get iyad to
    // design some, but they have to be transparent
    NavigationDestination(
      icon: IconButton(
          onPressed: () {
            HomePage();
          },
          icon: const Icon(Icons.home)),
      label: "Home",
    ),
    NavigationDestination(
        icon: IconButton(
            onPressed: () {
              const PaymentPage();
            },
            icon: const Icon(Icons.calendar_month)),
        label: "Calendar"),
    NavigationDestination(
        icon: Image.asset(
          'assets/images/Khalil2.jpeg',
          scale: 7,
          // tbh didn't have an icon in mind so I put a picture of me for funsies
        ),
        label: "XP"),
    NavigationDestination(
        icon: IconButton(onPressed: () {}, icon: const Icon(Icons.map)),
        label: "Map"),
  ];

  final List _navButtonContents = [
    (BuildContext context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              height: MediaQuery.of(context).size.height * 0.15,
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
    }
  ];

  final List<IconButton> _appBarButtonList = [
    // all the icons here are defaulted from flutter, we could get iyad to
    // design some, but they have to be transparent
    IconButton(
      icon: const Icon(Icons.help),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.notifications),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {},
    ),
  ];
}
