import 'package:flutter/material.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonContentsManager.buttonContents[7],
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
