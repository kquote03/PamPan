import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/bottom_bar.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/pantry/categories.dart';
import 'package:pam_pan/pantry/food_item.dart';
import 'package:pam_pan/pantry/item_description_card.dart';
import 'package:uuid/uuid.dart';

final realtime = Realtime(client);
final subscription = realtime.subscribe([
  'databases.6650884f00137e1b1fcd.collections.6650886f0027a739c072.documents'
]);

class Pantry extends StatefulWidget {
  const Pantry({super.key});
  @override
  State<Pantry> createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  List<Map<String, String>> categoriesList = [];

  List<FoodItem> currentItems = [];

  List<FoodItem> allItems = [];

  List<FoodItem> filteredItems = [];
  String searchQuery = '';
  List<String> selectedCategories = [];

  @override
  void initState() {
    _asyncQuery();
    super.initState();
  }

  _asyncQuery() async {
    List<FoodItem> fetchedItems = await getItems();
    List<Map<String, String>> fetchedCategories = await getCategories();
    setState(() {
      allItems = fetchedItems;
      currentItems = allItems;
      List<Map<String, String>> templist = [];
      for (var i in fetchedCategories) {
        templist.add(i);
      }
      categoriesList = templist;
    });
  }

  void filterItems() {
    setState(
      () {
        filteredItems = allItems.where(
          (foodItem) {
            final matchesSearchQuery = foodItem.itemName!
                .toLowerCase()
                .contains(searchQuery.toLowerCase());

            final matchesCategory = selectedCategories.isEmpty ||
                selectedCategories.contains(foodItem.categoryName);

            return matchesSearchQuery && matchesCategory;
          },
        ).toList();
        currentItems = filteredItems;
      },
    );
  }

  void selectCategory(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
      filterItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    subscription.stream.listen(
      (response) {
        setState(() {
          _asyncQuery();
        });
      },
    );

    print(allItems);

    List<GestureDetector> categoriesListMapped = categoriesList.map(
      (category) {
        return GestureDetector(
          onTap: () {
            selectCategory(category['id'] ?? "");
          },
          child: Catogeries(
            color: selectedCategories.contains(category['id'])
                ? const Color.fromARGB(255, 214, 201, 243)
                : Colors.white,
            //TODO: Bringback Nice Text
            text: category['name'] ?? "",
            image: 'assets/categories/${category['id']}.png',
          ),
        );
      },
    ).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Pam's Pantry",
          style: GoogleFonts.mukta(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Card(
                color: const Color.fromARGB(255, 253, 249, 249),
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
                  children: categoriesListMapped,
                ),
              ),
            ),
            Column(
              children: currentItems.map((foodItem) {
                return Slidable(
                  key: ValueKey(Uuid().v4()),
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),

                    // A pane can dismiss the Slidable.
                    dismissible: DismissiblePane(onDismissed: () {
                      deleteItemById(foodItem.itemId);
                    }),

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (BuildContext context) {
                          deleteItemById(foodItem.itemId);
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (BuildContext context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                print(foodItem.itemId);
                                return AddItemPage(id: "${foodItem.itemId}");
                              },
                            ),
                          );
                        },
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: ItemDescriptionCard(
                    image:
                        'assets/categories/${foodItem.categoryName ?? "other"}.png',
                    name: foodItem.itemName ?? "",
                    expiryDate: foodItem.expiryDate ?? "",
                    measurementUnit: foodItem.measurementUnit ?? "",
                    quantity: foodItem.quantity.toString(),
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
