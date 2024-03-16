import 'package:flutter/material.dart';

class AppBarButtonListManager {
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

  List<IconButton> getlist() {
    return _appBarButtonList;
  }
}
