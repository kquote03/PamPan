import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> _navigationButtonList = [
    NavigationDestination(
        icon: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        label: "Home"),
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

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("yooooo"),
          ),
          body: Container(
            child: const Center(),
          ),
          bottomNavigationBar: NavigationBar(
            destinations: _navigationButtonList,
          )),
    );
  }
}
