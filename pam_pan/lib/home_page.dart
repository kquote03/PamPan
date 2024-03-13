import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> _tabs = [
    NavigationDestination(
        icon: Image.asset(
          'assets/images/Khalil2.jpeg',
          scale: 1.9,
        ),
        label: "Home"),
    NavigationDestination(
        icon: Image.asset(
          'assets/images/Khalil2.jpeg',
          scale: 0.5,
        ),
        label: "Calendar"),
    NavigationDestination(
        icon: Image.asset(
          'assets/images/Khalil2.jpeg',
          scale: 7,
        ),
        label: "XP"),
    NavigationDestination(
        icon: Image.asset(
          'assets/images/Khalil2.jpeg',
          scale: 0.1,
        ),
        label: "SMTH"),
  ];

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Hello"),
          ),
          body: Container(
            child: const Center(),
          ),
          bottomNavigationBar: NavigationBar(
            destinations: _tabs,
          )),
    );
  }
}
