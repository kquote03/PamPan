import 'package:flutter/material.dart';
import 'package:pam_pan/calendar/calendar.dart';
import 'package:pam_pan/pantry/category.dart';
import 'package:pam_pan/pantry/items_list_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> gridCategories = [];

  @override
  Widget build(BuildContext context) {
    for (Category category in categories) {
      gridCategories.add(
        Container(
          decoration: const BoxDecoration(
              // border: Border.all(
              //   // width: 3,
              //   color: Colors.black,
              // ),
              ),
          child: Center(
            child: GestureDetector(
              onTap: category.goesTo,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  category.icon,
                  category.nameText
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Calendar(1),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: 600,
            child: DecoratedBox(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(103, 93, 51, 16)),
              child: Center(
                child: Scrollbar(
                  // trackVisibility: true,
                  // thumbVisibility: true,
                  // scrollbarOrientation: ScrollbarOrientation.left,

                  child: GridView.count(
                    crossAxisCount: 4,
                    // mainAxisSpacing: 7,
                    // crossAxisSpacing:5,
                    scrollDirection: Axis.horizontal,
                    childAspectRatio: 1.4,
                    children: gridCategories,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
