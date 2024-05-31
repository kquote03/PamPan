import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class NewCalendar extends StatefulWidget {
  const NewCalendar({super.key});

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
              setState(
                () {
                  final Appointment app = Appointment(
                      startTime: _controller.displayDate!,
                      endTime: _controller.displayDate!.add(
                        const Duration(hours: 2),
                      ),
                      isAllDay: true,
                      subject: 'Add Appointment',
                      color: Colors.pink);
                  _getCalendarDataSource().appointments?.add(app);
                  _getCalendarDataSource().notifyListeners(
                    CalendarDataSourceAction.add,
                    <Appointment>[app],
                  );
                },
              );
            },
            child: const Text("Add"),
          ),
          TextButton(
            onPressed: () {
              final Appointment removeAppointment =
                  _getCalendarDataSource().appointments![0];
              _getCalendarDataSource().appointments?.remove(removeAppointment);
              _getCalendarDataSource().notifyListeners(
                CalendarDataSourceAction.remove,
                <Appointment>[removeAppointment],
              );
            },
            child: const Text("Remove"),
          ),
          TextButton(
            onPressed: () {
              _getCalendarDataSource().appointments?.clear();
              _getCalendarDataSource().notifyListeners(
                CalendarDataSourceAction.reset,
                _getCalendarDataSource().appointments!,
              );
            },
            child: const Text("Reset"),
          ),
        ],
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
