import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MiriamCalendar extends StatefulWidget {
  const MiriamCalendar({super.key});

  @override
  State<MiriamCalendar> createState() => _MiriamCalendarState();
}

class _MiriamCalendarState extends State<MiriamCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text('Basic Calendar Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        monthViewSettings: const MonthViewSettings(showAgenda: true),
      ),
    );
  }
}
