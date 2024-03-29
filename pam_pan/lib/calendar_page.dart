import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime(2020, 1, 1),
      lastDay: DateTime(2222, 12, 31),
      focusedDay: DateTime.now(),
    );
  }
}
