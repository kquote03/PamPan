import 'package:flutter/material.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';
import 'package:pam_pan/pantry/category.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  Category bread = Category(
    const Text(
      "bread",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/bread.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  Category dairy = Category(
    const Text(
      "dairy",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/dairy.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  Category cheese = Category(
    const Text(
      "cheese",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/cheese.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  Category chicken = Category(
    const Text(
      "chicken",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/chicken.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  Category meats = Category(
    const Text(
      "meats",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/meats.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  Category fruits = Category(
    const Text(
      "fruits",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/fruits.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  Category vegetables = Category(
    const Text(
      "vegetables",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/vegetables.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  Category fish = Category(
    const Text(
      "fish",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/fish.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  Category party = Category(
    const Text(
      "party",
      style: TextStyle(fontSize: 20),
    ),
    IconButton(
      icon: Image.asset(
        'assets/categories/party.png',
        scale: 7,
      ),
      onPressed: () {},
    ),
  );

  // Category other = Category(
  //   "other",
  //   IconButton(
  //     icon: const Icon(Icons.heart_broken),
  //     onPressed: () {},
  //   ),
  // );

  final List<Widget> categoryList = [
    ListTile(
      title: const Text('bread'),
      enableFeedback: true,
      enabled: true,
      leading: Image.asset('assets/categories/bread.png'),
    ),
  ];

  late List<ListItem> items = itemGenerator();

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
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  Container(child: bread.icon),
                  Column(
                    children: [
                      bread.name,
                    ],
                  ),
                ],
              ),
              // const Row(
              //   children: [
              //     SizedBox(
              //       height: 500,
              //     ),
              //     Column(
              //       children: [
              //         ListView.builder(
              //           itemCount: items.length,
              //           itemBuilder: (context, index) {
              //             return items[index];
              //           },
              //         ),
              //       ],
              //     )
              //   ],
              // ),
            ],
          ),
          Row(
            children: [
              Container(child: cheese.icon),
              Column(children: [
                cheese.name,
              ]),
            ],
          ),
          Row(
            children: [
              Container(child: chicken.icon),
              Column(children: [
                chicken.name,
              ]),
            ],
          ),
          Row(
            children: [
              Container(child: dairy.icon),
              Column(children: [
                dairy.name,
              ]),
            ],
          ),
          Row(
            children: [
              Container(child: fish.icon),
              Column(children: [
                fish.name,
              ]),
            ],
          ),
          Row(
            children: [
              Container(child: fruits.icon),
              Column(children: [
                fruits.name,
              ]),
            ],
          ),
          Row(
            children: [
              Container(child: vegetables.icon),
              Column(children: [
                vegetables.name,
              ]),
            ],
          ),
          Row(
            children: [
              Container(child: meats.icon),
              Column(children: [
                meats.name,
              ]),
            ],
          ),
          Row(
            children: [
              Container(child: party.icon),
              Column(children: [
                party.name,
              ]),
            ],
          ),
        ],
      ),
    );
  }

  List<ListItem> itemGenerator() {
    return List.generate(
      5,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'),
    );
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
