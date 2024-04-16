import 'package:flutter/material.dart';
import 'package:pam_pan/calendars(temp)/calendar_week_only.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';

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
            child: SizedBox(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ButtonContentsManager.buttonContents[9];
                      },
                    ),
                  );
                },
                child: Image.asset(
                  "assets/bigPamHome/pam_expanded.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
