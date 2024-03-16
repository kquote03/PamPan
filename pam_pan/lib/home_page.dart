import 'package:flutter/material.dart';
import 'package:pam_pan/data/app_bar_button_list_manager.dart';
import 'package:pam_pan/data/nav_button_list_manager.dart';
import 'package:pam_pan/data/nav_buttons_contents_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NavButtonListManager navButtonList = NavButtonListManager();
  final NavButtonContentsManager navButtonContents = NavButtonContentsManager();
  final AppBarButtonListManager appBarButtonList = AppBarButtonListManager();

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
            leading: appBarButtonList.getlist()[0],
            actions: [
              appBarButtonList.getlist()[1],
              appBarButtonList.getlist()[2],
            ],
            backgroundColor: const Color.fromARGB(255, 178, 94, 91),
          ),
          body: navButtonContents.getList()[0],
          bottomNavigationBar: NavigationBar(
            destinations: navButtonList.getList(),
          )),
    );
  }
}
