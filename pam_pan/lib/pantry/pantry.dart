import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/bottom_bar.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/pantry/categories.dart';
import 'package:pam_pan/pantry/food_item.dart';
import 'package:pam_pan/pantry/item_description_card.dart';

final realtime = Realtime(client);
final subscription = realtime.subscribe([
  'databases.6650884f00137e1b1fcd.collections.6650886f0027a739c072.documents'
]);

List<Widget> categories = [
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Bread & Pastries",
      images: "assets/categories/bread.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Dairy & Eggs",
      images: "assets/categories/dairy_eggs.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Cheese",
      images: "assets/categories/fromage.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Chicken",
      images: "assets/categories/chicken.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Meats",
      images: "assets/categories/meat.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Fruits",
      images: "assets/categories/fruits.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Vegetables",
      images: "assets/categories/veg.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Fish & Seafood",
      images: "assets/categories/fish.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Herbs, Spices, & Condiments",
      images: "assets/categories/herbs.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white,
      text: "Nuts & Seeds",
      images: "assets/categories/nuts.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Drinks & Beverages",
      images: "assets/categories/bevs.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Sweets",
      images: "assets/categories/sweets.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Grains & Noodles",
      images: "assets/categories/grains.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Canned Foods",
      images: "assets/categories/can.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Pet Food",
      images: "assets/categories/pet.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: Colors.white, //cardColor
      text: "Other",
      images: "assets/categories/other.png",
    ),
  ),
];

class Pantry extends StatefulWidget {
  const Pantry({super.key});
  @override
  State<Pantry> createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  // List<Map<String, dynamic>> items = [];

  final List<List<String>> categoriesList = [
    ['bread', "Bread & Pastries"],
    ['dairy_eggs', "Dairy & Eggs"],
    ['fromage', "Cheese"],
    ['chicken', "Chicken"],
    ['meat', "Meats"],
    ['fruits', "Fruits"],
    ['veg', "Vegetables"],
    ['fish', "Fish & Seafood"],
    ['herbs', "Herbs, Spices, & Condiments"],
    ['nuts', "Nuts & Seeds"],
    ['bevs', "Drinks & Beverages"],
    ['sweets', "Sweets"],
    ['grains', "Grains & Noodles"],
    ['can', "Canned Foods"],
    ['pet', "Pet Food"],
    ['other', "Other"],
  ];

  final List<FoodItem> allItems = [];

  List<FoodItem> filteredItems = [];
  String searchQuery = '';

  @override
  void initState() {
    _asyncQuery();
    super.initState();
    filteredItems = allItems;
  }

  _asyncQuery() async {
    List<Map<String, dynamic>> fetchedItems = await getItems();
    setState(
      () {
        for (int i = 0; i < fetchedItems.length; i++) {
          allItems.add(
            FoodItem(
              itemId: fetchedItems[i]['\$id'],
              itemName: fetchedItems[i]['name'],
              expiryDate: fetchedItems[i]['expiryDate'],
              measurementUnit: fetchedItems[i]['measurementUnit'],
              quantity: fetchedItems[i]['quantity'],
              categoryName: fetchedItems[i]['categories'],
            ),
          );
        }
      },
    );
  }

  void filterItems() {
    setState(
      () {
        filteredItems = allItems.where(
          (foodItem) {
            final matchesSearchQuery = foodItem.itemName
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
            return matchesSearchQuery;
          },
        ).toList();
      },
    );
  }

  // List<FoodItem> buildList() {
  //   List<FoodItem> list = [];
  //   for (int i = 0; i < items.length; i++) {
  //     list.add(
  //       FoodItem(
  //         itemId: items[i]['\$id'],
  //         itemName: items[i]['name'],
  //         expiryDate: items[i]['expiryDate'],
  //         measurementUnit: items[i]['measurementUnit'],
  //         quantity: items[i]['quantity'],
  //         categoryName: items[i]['categories'],
  //       ),
  //     );
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    subscription.stream.listen(
      (response) {
        // Callback will be executed on all account events.
        setState(
          () {
            _asyncQuery();
          },
        );
      },
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text("Pam's Pantry"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                ),
                                onChanged: (query) {
                                  searchQuery = query;
                                  filterItems();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13.0, left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoriesList.map(
                    (category) {
                      return GestureDetector(
                        onTap: () {},
                        child: Catogeries(
                          color: Colors.white,
                          text: category[1],
                          images: 'assets/categories/${category[0]}.png',
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Column(
              children: filteredItems.map((foodItem) {
                return Slidable(
                  key: ValueKey(Random()),
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),

                    // A pane can dismiss the Slidable.
                    dismissible: DismissiblePane(onDismissed: () {}),

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (BuildContext context) {
                          // deleteItemById(foodItem.itemId);
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (BuildContext context) {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       print(foodItem.itemId);
                          //       return AddItemPage(id: "${foodItem.itemId}");
                          //     },
                          //   ),
                          // );
                        },
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: ItemDescriptionCard(
                    image: 'assets/categories/bread.png',
                    name: foodItem.itemName,
                    expiryDate: foodItem.expiryDate,
                    measurementUnit: foodItem.measurementUnit,
                    quantity: foodItem.quantity,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

// class EmptyView extends StatelessWidget {
//   const EmptyView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.error,
//           color: Colors.red,
//         ),
//         Text('Pantry is empty :('),
//       ],
//     );
//   }
// }
