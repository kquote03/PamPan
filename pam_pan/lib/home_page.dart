import 'package:flutter/material.dart';
import 'package:pam_pan/calendars(temp)/calendar_week_only.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';
import 'package:pam_pan/pantry/expandable_list.dart';

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 400,
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                categories.length,
                (index) {
                  return Center(
                    child: Column(
                      children: [
                        categories[index].icon,
                        Text(
                          categories[index].nameString,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ButtonContentsManager.buttonContents[8];
                  },
                ),
              );
            },
            child: Image.asset(
              "assets/bigPamHome/pam_normal.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
