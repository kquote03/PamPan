import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class NewCalendar extends StatefulWidget {
  const NewCalendar({Key? key}) : super(key: key);

  @override
  State<NewCalendar> createState() => _NewCalendarState();
}

List<Appointment> appointments = [];

class _NewCalendarState extends State<NewCalendar> {
  final CalendarController _controller = CalendarController();

  @override 
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        dataSource: _getCalendarDataSource(),
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    DateTime date;
    if (_controller.selectedDate == null) {
      date = DateTime.now().add(const Duration(minutes: 10));
    } else {
      date = _controller.selectedDate!.add(const Duration(minutes: 10));
    }
    appointments.add(
      Appointment(
        startTime: _controller.selectedDate ?? DateTime.now(),
        endTime: (_controller.selectedDate ?? DateTime.now())
            .add(const Duration(minutes: 10)),
        subject: 'Ass',
        color: const Color.fromARGB(255, 255, 255, 255),
        startTimeZone: '',
        endTimeZone: '',
        isAllDay: true,
      ),
    );
    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
