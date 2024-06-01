import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/pantry/food_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final realtime = Realtime(client);
final subscription = realtime.subscribe([
  'databases.6650884f00137e1b1fcd.collections.6650886f0027a739c072.documents'
]);

class NewCalendar extends StatefulWidget {
  const NewCalendar({super.key});

  @override
  State<NewCalendar> createState() => _NewCalendarState();
}

List<Appointment> appointments = [];

class _NewCalendarState extends State<NewCalendar> {
  final CalendarController _controller = CalendarController();

  List<FoodItem> _itemsList = [];
  _AppointmentDataSource dataSource = _AppointmentDataSource(appointments);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _asyncQuery() async {
    List<FoodItem> fetchedItems = await getItems();
    setState(
      () {
        _itemsList = fetchedItems;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _asyncQuery();
    dataSource = _getCalendarDataSource();
  }

  List<Color> colours = [
    Colors.black,
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.blue,
    Colors.indigo,
  ];

  _AppointmentDataSource _getCalendarDataSource() {
    for (int i = 0; i < _itemsList.length; i++) {
      appointments.add(
        Appointment(
          startTime: stringToDate(_itemsList[i].expiryDate!),
          endTime: stringToDate(_itemsList[i].expiryDate!),
          isAllDay: true,
          color: colours[Random().nextInt(colours.length)],
          subject: _itemsList[i].toString(),
        ),
      );
      dataSource.notifyListeners(CalendarDataSourceAction.reset, appointments);
    }

    return _AppointmentDataSource(appointments);
  }

  @override
  Widget build(BuildContext context) {
    // _getCalendarDataSource.appointments!.add(app);
    // _getCalendarDataSource.notifyListeners(
    //     CalendarDataSourceAction.add, <Appointment>[app]);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Calendar'),
      ),
      body: SfCalendar(
        controller: _controller,
        view: CalendarView.month,
        headerStyle: const CalendarHeaderStyle(
          backgroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 25),
        ),
        monthViewSettings: const MonthViewSettings(
          showAgenda: true,
          appointmentDisplayCount: 5,
          navigationDirection: MonthNavigationDirection.horizontal,
          agendaStyle: AgendaStyle(
            appointmentTextStyle: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
            dateTextStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            dayTextStyle: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          monthCellStyle: MonthCellStyle(
            backgroundColor: Colors.white,
            trailingDatesBackgroundColor: Color.fromARGB(230, 243, 238, 238),
            leadingDatesBackgroundColor: Color.fromARGB(230, 243, 238, 238),
            todayBackgroundColor: Color.fromARGB(129, 255, 255, 255),
            textStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Arial',
            ),
            // ignore: deprecated_member_use
            todayTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arial',
            ),
            trailingDatesTextStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
              fontFamily: 'Arial',
            ),
            leadingDatesTextStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
              fontFamily: 'Arial',
            ),
          ),
        ),
        dataSource: dataSource,
      ),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
