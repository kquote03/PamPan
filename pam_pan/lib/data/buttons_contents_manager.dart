import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ButtonContentsManager {
  static final List<Widget> buttonContents = [
    LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child: const Center(
                  child: Text('Mini calendar widget - incomplete'),
                ),
              ),
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
      },
    ),
    TableCalendar(
      firstDay: DateTime(2020, 1, 1),
      lastDay: DateTime(2222, 12, 31),
      focusedDay: DateTime.now(),
    ),
    Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            style: TextStyle(
              fontSize: 24,
            ),
            "Donating to help the hungry. A worthy endevour.",
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            style: TextStyle(
              fontSize: 12,
            ),
            "Any donation you make through us would go straight to the United Nation's World Food Programme (WFP), which aims to distribute food to as many hungry people as possible, across the globe.",
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Card Name',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      //maybe we can make this a drop down menu like the real expiration payment pages
                      decoration: InputDecoration(
                        labelText: 'Expiration Date',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'CVV',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Process Donation'),
              ),
            ],
          ),
        ),
      ],
    ),
  ];
}
