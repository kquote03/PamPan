import 'package:flutter/material.dart';
import 'package:pam_pan/MiriamMap/miriam_map.dart';
import 'package:pam_pan/calendars(temp)/calendar_page.dart';
import 'package:pam_pan/calendars(temp)/calendar_page_complex.dart';
import 'package:pam_pan/calendars(temp)/calendar_page_events.dart';
import 'package:pam_pan/calendars(temp)/calendar_page_multi.dart';
import 'package:pam_pan/calendars(temp)/calendar_page_range.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/miriamCalendar/miriam_calendar.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/payment_page.dart';
import 'package:pam_pan/profile/profile_page.dart';

class ButtonContentsManager {
  static final List<Widget> buttonContents = [
    const HomePage(), //0
    const PaymentPage(), //1
    const CalendarPage(), //2
    const TableEventsExample(), //3
    const TableComplexExample(), //4
    const TableMultiExample(), //5
    const TableRangeExample(), //6
    const ProfilePage(), //7
    const Placeholder(), //8
    const AddItemPage(), //9
    const MiriamCalendar(), //10
    const MiriamMap() //11
  ];

  static final List<String> pageLabels = [
    "",
    "Donation",
    "Basic Calendar Page",
    "Table Events Cal",
    "Table Complex Cal",
    "Table Multi Cal",
    "Table Range Cal",
    "Profile",
    "Category"
  ];
}
