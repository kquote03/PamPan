import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class NewCalendar extends StatefulWidget {
  const NewCalendar({super.key});

  @override
  State<NewCalendar> createState() => _NewCalendarState();
}

class _NewCalendarState extends State<NewCalendar> {
  final CalendarController _controller = CalendarController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void buttonClicked(int index) {
    if (index == 1) {
      setState(
        () {
          final Appointment app = Appointment(
              startTime: _controller.displayDate!,
              endTime: _controller.displayDate!.add(
                const Duration(hours: 2),
              ),
              subject: 'Add Appointment',
              color: Colors.pink);
          _getCalendarDataSource().appointments!.add(app);
          _getCalendarDataSource().notifyListeners(
            CalendarDataSourceAction.add,
            <Appointment>[app],
          );
        },
      );
    } else if (index == 2) {
      setState(
        () {
          final Appointment removeAppointment =
              _getCalendarDataSource().appointments![0];
          _getCalendarDataSource().appointments!.remove(removeAppointment);
          _getCalendarDataSource().notifyListeners(
            CalendarDataSourceAction.remove,
            <Appointment>[removeAppointment],
          );
        },
      );
    } else if (index == 3) {
      _getCalendarDataSource().appointments!.clear();
      _getCalendarDataSource().notifyListeners(
        CalendarDataSourceAction.reset,
        _getCalendarDataSource().appointments!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      ),
      body: SfCalendar(
        controller: _controller,
        view: CalendarView.month,
        monthViewSettings: const MonthViewSettings(
          showAgenda: true,
          appointmentDisplayCount: 5,
          navigationDirection: MonthNavigationDirection.horizontal,
          agendaStyle: AgendaStyle(
            backgroundColor: Color.fromARGB(239, 102, 204, 204),
            appointmentTextStyle: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(238, 255, 204, 0),
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
            backgroundColor: Color.fromARGB(129, 41, 52, 98),
            trailingDatesBackgroundColor: Color.fromARGB(129, 33, 102, 131),
            leadingDatesBackgroundColor: Color.fromARGB(129, 33, 101, 131),
            todayBackgroundColor: Color.fromARGB(129, 247, 190, 22),
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
      bottomNavigationBar: NavigationBar(
        destinations: [
          TextButton(
            onPressed: () {
              buttonClicked(1);
            },
            child: const Text("Remove"),
          ),
          TextButton(
            onPressed: () {
              buttonClicked(2);
            },
            child: const Text("Remove"),
          ),
          TextButton(
            onPressed: () {
              buttonClicked(3);
            },
            child: const Text("Reset"),
          ),
        ],
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(minutes: 10)),
        subject: 'Ass',
        color: Colors.blue,
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
