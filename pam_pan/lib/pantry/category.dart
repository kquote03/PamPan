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
    scale: 15,
  ),
);

Category dairy = Category(
  const Text(
    "Dairy & Eggs",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Dairy & Eggs",
  Image.asset(
    'assets/categories/dairy_eggs.png',
    scale: 15,
  ),
);

Category cheese = Category(
  const Text(
    "Cheese",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Cheese",
  Image.asset(
    'assets/categories/fromage.png',
    scale: 15,
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
    scale: 15,
  ),
);

Category meats = Category(
  const Text(
    "Meats",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Meats",
  Image.asset(
    'assets/categories/meat.png',
    scale: 15,
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
    scale: 15,
  ),
);

Category vegetables = Category(
  const Text(
    "Vegetables",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Vegetables",
  Image.asset(
    'assets/categories/veg.png',
    scale: 15,
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
    scale: 15,
  ),
);

// ignore: non_constant_identifier_names
Category HSC = Category(
  const Text(
    "Herbs, Spices, & Condiments",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Herbs, Spices, & Condiments",
  Image.asset(
    'assets/categories/herbs.png',
    scale: 15,
  ),
);

Category nutsSeeds = Category(
  const Text(
    "Nuts & Seeds",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Nuts & Seeds",
  Image.asset(
    'assets/categories/nuts.png',
    scale: 15,
  ),
);

Category drinksBeverages = Category(
  const Text(
    "Drinks & Beverages",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Drinks & Beverages",
  Image.asset(
    'assets/categories/bevs.png',
    scale: 15,
  ),
);

Category sweets = Category(
  const Text(
    "Sweets",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Sweets",
  Image.asset(
    'assets/categories/sweets.png',
    scale: 15,
  ),
);

Category grainsNoodles = Category(
  const Text(
    "Grains & Noodles",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Grains & Noodles",
  Image.asset(
    'assets/categories/grains.png',
    scale: 15,
  ),
);

Category canned = Category(
  const Text(
    "Canned Foods",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Canned Foods",
  Image.asset(
    'assets/categories/can.png',
    scale: 15,
  ),
);

Category pet = Category(
  const Text(
    "Pet Food",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Pet Food",
  Image.asset(
    'assets/categories/pet.png',
    scale: 15,
  ),
);

Category plus = Category(
  const Text(
    "Plus",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  "Plus",
  Image.asset(
    'assets/categories/other.png',
    scale: 15,
  ),
);

List<Category> categories = [
  bread,
  drinksBeverages,
  chicken,
  nutsSeeds,
  dairy,
  fruits,
  fish,
  canned,
  cheese,
  vegetables,
  grainsNoodles,
  pet,
  sweets,
  meats,
  HSC,
  plus
];
