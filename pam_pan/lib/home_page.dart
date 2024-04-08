import 'package:flutter/material.dart';
import 'package:pam_pan/calendars(temp)/calendar_week_only.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CalendarPageWeek(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              child: const Center(
                child: Text(
                    'Pam and buttons and the pantry - incomplete - is clickable and will take you to the full pantry page'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
