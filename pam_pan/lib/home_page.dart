import 'package:flutter/material.dart';
import 'package:pam_pan/calendars(temp)/calendar_week_only.dart';
import 'package:pam_pan/pantry/category.dart';
import 'package:pam_pan/pantry/items_list_page.dart';

final List<String> categoriesList = [
  "Herbs, Spices, & Condiments",
  "Drinks & Beverages",
  "Nuts & Seeds",
  "Sweets",
  "Grains & Noodles",
  "Canned Food",
  "Pet Food",
  "Chicken",
  "Bread & Pastries",
  "Dairy & Eggs",
  "Cheese",
  "Meats",
  "Fruits",
  "Fish & Seafood",
  "Vegetables",
  "Other",
];

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
        Container(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: 600,
            child: DecoratedBox(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(103, 93, 51, 16)),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 7,
                  // crossAxisSpacing:5,
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 1.4,
                  children: List.generate(
                    categories.length,
                    (index) {
                      return Center(
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
                      );
                    },
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
