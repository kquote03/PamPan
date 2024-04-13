import 'package:flutter/material.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';
import 'package:pam_pan/pantry/category.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  Category bread = Category(
    "bread",
    IconButton(
      icon: Image.asset('assets/categories/bread.png'),
      onPressed: () {},
    ),
  );

  Category dairy = Category(
    "dairy",
    IconButton(
      icon: Image.asset('assets/categories/dairy.png'),
      onPressed: () {},
    ),
  );

  Category cheese = Category(
    "cheese",
    IconButton(
      icon: Image.asset('assets/categories/cheese.png'),
      onPressed: () {},
    ),
  );

  Category chicken = Category(
    "chicken",
    IconButton(
      icon: Image.asset('assets/categories/chicken.png'),
      onPressed: () {},
    ),
  );

  Category meats = Category(
    "meats",
    IconButton(
      icon: Image.asset('assets/categories/meats.png'),
      onPressed: () {},
    ),
  );

  Category fruits = Category(
    "fruits",
    IconButton(
      icon: Image.asset('assets/categories/fruits.png'),
      onPressed: () {},
    ),
  );

  Category vegetables = Category(
    "vegetables",
    IconButton(
      icon: Image.asset('assets/categories/vegetables.png'),
      onPressed: () {},
    ),
  );

  Category fish = Category(
    "fish",
    IconButton(
      icon: Image.asset('assets/categories/fish.png'),
      onPressed: () {},
    ),
  );

  Category party = Category(
    "party",
    IconButton(
      icon: Image.asset('assets/categories/party.png'),
      onPressed: () {},
    ),
  );

  Category other = Category(
    "other",
    IconButton(
      icon: const Icon(Icons.heart_broken),
      onPressed: () {},
    ),
  );

  final List<ListTile> categoryList = [
    ListTile(
      title: const Text('bread'),
      enableFeedback: true,
      enabled: true,
      leading: Image.asset('assets/categories/bread.png'),
    ),
  ];
  // [
  //   Category(
  //       "bread",
  //       IconButton(
  //         icon: Image.asset('assets/categories/bread.png'),
  //         onPressed: () {},
  //       )),
  //   Category(
  // "dairy",
  // IconButton(
  //   icon: Image.asset('assets/categories/dairy.png'),
  //   onPressed: () {},
  // )),
  //   Category(
  //       "cheese",
  //       IconButton(
  //         icon: Image.asset('assets/categories/cheese.png'),
  //         onPressed: () {},
  //       )),
  //   Category(
  //       "chicken",
  //       IconButton(
  //         icon: Image.asset('assets/categories/chicken.png'),
  //         onPressed: () {},
  //       )),
  //   Category(
  // "meats",
  // IconButton(
  //   icon: Image.asset('assets/categories/meats.png'),
  //   onPressed: () {},
  // ),),
  //   Category(
  // "fruits",
  // IconButton(
  //   icon: Image.asset('assets/categories/fruits.png'),
  //   onPressed: () {},
  //       )),
  //   Category(
  // "vegetables",
  // IconButton(
  //   icon: Image.asset('assets/categories/vegetables.png'),
  //   onPressed: () {},
  //       )),
  //   Category(
  // "other",
  // IconButton(
  //   icon: const Icon(Icons.heart_broken),
  //   onPressed: () {},
  //       )),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: Text(ButtonContentsManager.pageLabels[2]),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {},
      ),
    );
  }
}
