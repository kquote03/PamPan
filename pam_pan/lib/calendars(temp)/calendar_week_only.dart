// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarPageWeek extends StatefulWidget {
//   const CalendarPageWeek({super.key});

//   @override
//   State<CalendarPageWeek> createState() => _CalendarPageWeek();
// }

// class _CalendarPageWeek extends State<CalendarPageWeek> {
//   final CalendarFormat _calendarFormat = CalendarFormat.week;
//   // DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       firstDay: DateTime(2020, 1, 1),
//       lastDay: DateTime(2222, 12, 31),
//       focusedDay: DateTime.now(),
//       calendarFormat: _calendarFormat,
//       selectedDayPredicate: (day) {
//         return isSameDay(_selectedDay, day);
//       },
//       onDaySelected: (selectedDay, focusedDay) {
//         if (!isSameDay(_selectedDay, selectedDay)) {
//           setState(() {
//             _selectedDay = selectedDay;
//             // _focusedDay = focusedDay;
//           });
//         }
//       },
//       availableCalendarFormats: const {CalendarFormat.week: "week"},
//       headerVisible: false,
//     );
//   }
// }
