import 'package:flutter/material.dart';
import 'package:pam_pan/calendars(temp)/calendar_page.dart';
import 'package:pam_pan/calendars(temp)/calendar_page_complex.dart';
import 'package:pam_pan/calendars(temp)/calendar_page_events.dart';
import 'package:pam_pan/calendars(temp)/calendar_page_multi.dart';
import 'package:pam_pan/calendars(temp)/calendar_page_range.dart';
import 'package:pam_pan/calendars(temp)/calendar_week_only.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/payment_page.dart';

class ButtonContentsManager {
  static final List<Widget> buttonContents = [
    const HomePage(),
    const PaymentPage(),
    const CalendarPage(),
    const TableEventsExample(),
    const TableComplexExample(),
    const TableMultiExample(),
    const TableRangeExample(),
    const CalendarPageWeek(),
  ];
}
