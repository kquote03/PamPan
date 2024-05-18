import 'package:flutter/material.dart';

class Category {
  final Text nameText;
  final String nameString;
  final List<Widget>? items;
  final Widget icon;

  Category(this.nameText, this.nameString, this.icon, {this.items});

  // void addItem
}

Category bread = Category(
  const Text(
    "Bread & Pastries",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Bread & Pastries",
  Image.asset(
    'assets/categories/bread.png',
    scale: 9,
  ),
);

Category dairy = Category(
  const Text(
    "Dairy & Eggs",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Dairy & Eggs",
  Image.asset(
    'assets/categories/dairy.png',
    scale: 9,
  ),
);

Category cheese = Category(
  const Text(
    "Cheese",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Cheese",
  Image.asset(
    'assets/categories/cheese.png',
    scale: 9,
  ),
);

Category chicken = Category(
  const Text(
    "Chicken",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Chicken",
  Image.asset(
    'assets/categories/chicken.png',
    scale: 9,
  ),
);

Category meats = Category(
  const Text(
    "Meats",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Meats",
  Image.asset(
    'assets/categories/meats.png',
    scale: 9,
  ),
);

Category fruits = Category(
  const Text(
    "Fruits",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Fruits",
  Image.asset(
    'assets/categories/fruits.png',
    scale: 9,
  ),
);

Category vegetables = Category(
  const Text(
    "Vegetables",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Vegetables",
  Image.asset(
    'assets/categories/vegetables.png',
    scale: 9,
  ),
);

Category fish = Category(
  const Text(
    "Fish & Seafood",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Fish & Seafood",
  Image.asset(
    'assets/categories/fish.png',
    scale: 9,
  ),
);

// ignore: non_constant_identifier_names
Category HSC = Category(
  const Text(
    "Herbs, Spices, & Condiments",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Herbs, Spices, & Condiments",
  const Icon(
    Icons.heart_broken,
    size: 40,
  ),
);

Category nutsSeeds = Category(
  const Text(
    "Nuts & Seeds",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Nuts & Seeds",
  const Icon(
    Icons.heart_broken,
    size: 40,
  ),
);

Category drinksBeverages = Category(
  const Text(
    "Drinks & Beverages",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Drinks & Beverages",
  const Icon(
    Icons.heart_broken,
    size: 40,
  ),
);

Category sweetsCandies = Category(
  const Text(
    "Sweets & Candies",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Sweets & Candies",
  const Icon(
    Icons.heart_broken,
    size: 40,
  ),
);

Category grainsNoodles = Category(
  const Text(
    "Grains & Noodles",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Grains & Noodles",
  const Icon(
    Icons.heart_broken,
    size: 40,
  ),
);

Category canned = Category(
  const Text(
    "Canned Foods",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Canned Foods",
  const Icon(
    Icons.heart_broken,
    size: 40,
  ),
);

Category pet = Category(
  const Text(
    "Pet Food",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Pet Food",
  const Icon(
    Icons.heart_broken,
    size: 40,
  ),
);

Category plus = Category(
  const Text(
    "Plus",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Plus",
  const Icon(
    Icons.plus_one_sharp,
    size: 45,
  ),
);

List<Category> categories = [
  bread,
  dairy,
  cheese,
  chicken,
  meats,
  fish,
  fruits,
  vegetables,
  HSC,
  nutsSeeds,
  drinksBeverages,
  sweetsCandies,
  grainsNoodles,
  canned,
  pet,
  plus
];
