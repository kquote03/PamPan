import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pam_pan/bottom_bar.dart';
import 'package:pam_pan/pantryNEW/colors.dart';
import 'package:pam_pan/pantryNEW/categories.dart';
import 'package:pam_pan/pantryNEW/explorecart.dart';

List<Widget> categories = [
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Bread & Pastries",
      images: "assets/categories/bread.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Dairy & Eggs",
      images: "assets/categories/dairy_eggs.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Cheese",
      images: "assets/categories/fromage.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Chicken",
      images: "assets/categories/chicken.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Meats",
      images: "assets/categories/meat.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Fruits",
      images: "assets/categories/fruits.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Vegetables",
      images: "assets/categories/veg.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Fish & Seafood",
      images: "assets/categories/fish.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Herbs, Spices, & Condiments",
      images: "assets/categories/herbs.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Nuts & Seeds",
      images: "assets/categories/nuts.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Drinks & Beverages",
      images: "assets/categories/bevs.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Sweets",
      images: "assets/categories/sweets.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Grains & Noodles",
      images: "assets/categories/grains.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Canned Foods",
      images: "assets/categories/can.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
      text: "Pet Food",
      images: "assets/categories/pet.png",
    ),
  ),
  GestureDetector(
    onTap: () {},
    child: const Catogeries(
      color: cardColor,
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
  @override
  Widget build(BuildContext context) {
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
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: inActiveColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Search",
                              style: TextStyle(
                                fontSize: 15,
                                color: inActiveColor,
                              ),
                            ),
                          )
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
                  children: categories,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                  image: "assets/categories/bread.png",
                  name: "White bread",
                  expiryDate: "2024-06-01",
                  measurementUnit: "pieces",
                  quantity: "5"),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/herbs.png",
                name: "Paprika",
                expiryDate: "2026-12-12",
                measurementUnit: "g",
                quantity: "50",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/grains.png",
                name: "Basmati Rice",
                expiryDate: "2025-01-01",
                measurementUnit: "Kg",
                quantity: "2",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/fish.png",
                name: "Sushi",
                expiryDate: "2024-06-15",
                measurementUnit: "pieces",
                quantity: "12",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                  image: "assets/categories/bread.png",
                  name: "White bread",
                  expiryDate: "2024-06-01",
                  measurementUnit: "pieces",
                  quantity: "5"),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/herbs.png",
                name: "Paprika",
                expiryDate: "2026-12-12",
                measurementUnit: "g",
                quantity: "50",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/grains.png",
                name: "Basmati Rice",
                expiryDate: "2025-01-01",
                measurementUnit: "Kg",
                quantity: "2",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/fish.png",
                name: "Sushi",
                expiryDate: "2024-06-15",
                measurementUnit: "pieces",
                quantity: "12",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                  image: "assets/categories/bread.png",
                  name: "White bread",
                  expiryDate: "2024-06-01",
                  measurementUnit: "pieces",
                  quantity: "5"),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/herbs.png",
                name: "Paprika",
                expiryDate: "2026-12-12",
                measurementUnit: "g",
                quantity: "50",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/grains.png",
                name: "Basmati Rice",
                expiryDate: "2025-01-01",
                measurementUnit: "Kg",
                quantity: "2",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ItemDescriptionCard(
                image: "assets/categories/fish.png",
                name: "Sushi",
                expiryDate: "2024-06-15",
                measurementUnit: "pieces",
                quantity: "12",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
