import 'package:flutter/material.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';
import 'package:pam_pan/pantry/category.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final List<Category> categoryList = [
    Category(
        "bread",
        IconButton(
          icon: Image.asset('assets/categories/bread.png'),
          onPressed: () {},
        )),
    Category(
        "dairy",
        IconButton(
          icon: Image.asset('assets/categories/dairy.png'),
          onPressed: () {},
        )),
    Category(
        "cheese",
        IconButton(
          icon: Image.asset('assets/categories/cheese.png'),
          onPressed: () {},
        )),
    Category(
        "chicken",
        IconButton(
          icon: Image.asset('assets/categories/chicken.png'),
          onPressed: () {},
        )),
    Category(
        "meats",
        IconButton(
          icon: Image.asset('assets/categories/meats.png'),
          onPressed: () {},
        )),
    Category(
        "fruits",
        IconButton(
          icon: Image.asset('assets/categories/fruits.png'),
          onPressed: () {},
        )),
    Category(
        "vegetables",
        IconButton(
          icon: Image.asset('assets/categories/vegetables.png'),
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
    return Scaffold(
        appBar: AppBar(
          title: Text(ButtonContentsManager.pageLabels[2]),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(8, (index) {
              return Center(
                child: categoryList[index].icon,
              );
            }),
          ),
        ));
  }
}
