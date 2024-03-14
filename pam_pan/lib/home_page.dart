import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> _navigationButtonList = [
    // all the icons here are defaulted from flutter, we could get iyad to
    // design some, but they have to be transparent
    NavigationDestination(
      icon: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
      label: "Home",
    ),
    NavigationDestination(
        icon: IconButton(
            onPressed: () {
              HomePage();
            },
            icon: const Icon(Icons.calendar_month)),
        label: "Calendar"),
    NavigationDestination(
        icon: Image.asset(
          'assets/images/Khalil2.jpeg',
          scale: 7,
        ),
        label: "XP"),
    NavigationDestination(
        icon: IconButton(onPressed: () {}, icon: const Icon(Icons.map)),
        label: "Map"),
  ];

  final List<IconButton> _appBarButtonList = [
    // all the icons here are defaulted from flutter, we could get iyad to
    // design some, but they have to be transparent
    IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        // Handle leading icon tap
      },
    ),
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        // Handle search action tap
      },
    ),
    IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        // Handle settings action tap
      },
    ),
  ];

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My App'),
            leading: _appBarButtonList[0],
            actions: [
              _appBarButtonList[1],
              _appBarButtonList[2],
            ],
            backgroundColor: const Color.fromARGB(255, 91, 115, 136),
          ),
          body: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: PageView(
                children: <Widget>[
                  // Pages containing different content
                  Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text('Page 1'),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text('Page 2'),
                    ),
                  ),
                  Container(
                    color: Colors.orange,
                    child: const Center(
                      child: Text('Page 3'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: NavigationBar(
            destinations: _navigationButtonList,
          )),
    );
  }
}
