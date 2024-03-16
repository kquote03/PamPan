import 'package:flutter/material.dart';

class NavButtonContentsManager {
  static final List<Widget> _navButtonContents = [
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
    )
  ];

  List getList() {
    return _navButtonContents;
  }
}
