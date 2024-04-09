import 'package:flutter/material.dart';
import 'package:pam_pan/pantry/category.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final List<Category> categoryList = [
    Category(
        "bread",
        IconButton(
          icon: const Icon(Icons.heart_broken),
          onPressed: () {},
        )),
    Category(
        "milk",
        IconButton(
          icon: const Icon(Icons.heart_broken),
          onPressed: () {},
        )),
    Category(
        "cheese",
        IconButton(
          icon: const Icon(Icons.heart_broken),
          onPressed: () {},
        )),
    Category(
        "chicken",
        IconButton(
          icon: const Icon(Icons.heart_broken),
          onPressed: () {},
        )),
    Category(
        "meats",
        IconButton(
          icon: const Icon(Icons.heart_broken),
          onPressed: () {},
        )),
    Category(
        "fruits",
        IconButton(
          icon: const Icon(Icons.heart_broken),
          onPressed: () {},
        )),
    Category(
        "vegetables",
        IconButton(
          icon: const Icon(Icons.heart_broken),
          onPressed: () {},
        )),
    Category(
        "other",
        IconButton(
          icon: const Icon(Icons.heart_broken),
          onPressed: () {},
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(8, (index) {
          return Center(
            child: categoryList[index].icon,
          );
        }),
      ),
    );
  }
}
