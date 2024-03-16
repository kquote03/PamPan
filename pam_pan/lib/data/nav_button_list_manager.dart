import 'package:flutter/material.dart';

class NavButtonListManager {
  static final List<NavigationDestination> _navButtonList = [
    // all the icons here are defaulted from flutter, we could get iyad to
    // design some, but they have to be transparent
    NavigationDestination(
      icon: IconButton(
          onPressed: () {
            onTapHome;
          },
          icon: const Icon(Icons.home)),
      label: "Home",
    ),
    NavigationDestination(
        icon: IconButton(
            onPressed: () {
              // const PaymentPage();
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

  List<NavigationDestination> getList() {
    return _navButtonList;
  }
}

onTapHome() {}
