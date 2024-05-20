import 'package:flutter/material.dart';
import 'package:pam_pan/calendar/calendar.dart';
import 'package:pam_pan/pantry/category.dart';
import 'package:pam_pan/pantry/items_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    children: List.generate(
                      categories.length,
                      (index) {
                        return Container(
                          decoration: const BoxDecoration(
                              // border: Border.all(
                              //   // width: 3,
                              //   color: Colors.black,
                              // ),
                              ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ItemListPage(
                                          categories[index].nameString);
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  categories[index].icon,
                                  Text(
                                    categories[index].nameString,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
