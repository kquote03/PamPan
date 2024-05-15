import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pam_pan/database/libdb.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/page_skeleton.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageSkeleton(),
    ),
  );
}

//ignore it is for tests VV

// void main() {
  // final List<List<String>> items = [
    // ["2024-05-18", "Item4"],
    // ["2024-05-15", "Item1"],
    // ["2024-05-16", "Item2"],
    // ["2024-05-17", "Item3"],
    // ["2024-05-19", "Item5"],
  // ];
// 
  // List<List<String>> sortList(List<List<String>> list) {
    // list.sort((a, b) => a[0].compareTo(b[0]));
    // return list;
  // }
// 
  // int daysBetween(DateTime from, DateTime to) {
    // from = DateTime(from.year, from.month, from.day);
    // to = DateTime(to.year, to.month, to.day);
    // return (to.difference(from).inHours / 24).round();
  // }
// 
  // DateTime stringToDate(String date) {
    // return DateTime.parse(date);
  // }
// 
  // for (int i = 0; i < items.length; i++) {
    // print(items[i]);
  // }
// 
  // List<List<String>> newList = sortList(items);
// 
  // for (int i = 0; i < newList.length; i++) {
    // print(newList[i]);
  // }
// 
  // print(daysBetween(stringToDate(newList[1][0]), stringToDate(newList[0][0])));
// }