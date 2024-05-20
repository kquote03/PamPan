import 'package:flutter/material.dart';
import 'package:pam_pan/pantry/items_list_page.dart';

class Category {
  final Text nameText;
  final List<Widget>? items;
  final Widget icon;
  final Function goesTo;

  Category(this.nameText, this.icon, this.goesTo, {this.items});

  // void addItem
}

Category bread = Category(
  const Text(
    "Bread & Pastries",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/bread.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Bread & Pastries");
        },
      ),
    );
  },
);

Category dairy = Category(
  const Text(
    "Dairy & Eggs",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/dairy_eggs.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Dairy & Eggs");
        },
      ),
    );
  },
);

Category cheese = Category(
  const Text(
    "Cheese",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/fromage.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Cheese");
        },
      ),
    );
  },
);

Category chicken = Category(
  const Text(
    "Chicken",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/chicken.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Chicken");
        },
      ),
    );
  },
);

Category meats = Category(
  const Text(
    "Meats",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/meat.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Meats");
        },
      ),
    );
  },
);

Category fruits = Category(
  const Text(
    "Fruits",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/fruits.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Fruits");
        },
      ),
    );
  },
);

Category vegetables = Category(
  const Text(
    "Vegetables",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/veg.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Vegetables");
        },
      ),
    );
  },
);

Category fish = Category(
  const Text(
    "Fish & Seafood",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/fish.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Fish & Seafood");
        },
      ),
    );
  },
);

// ignore: non_constant_identifier_names
Category HSC = Category(
  const Text(
    "Herbs, Spices, & Condiments",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/herbs.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Herbs, Spices, & Condiments");
        },
      ),
    );
  },
);

Category nutsSeeds = Category(
  const Text(
    "Nuts & Seeds",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/nuts.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Nuts & Seeds");
        },
      ),
    );
  },
);

Category drinksBeverages = Category(
  const Text(
    "Drinks & Beverages",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/bevs.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Drinks & Beverages");
        },
      ),
    );
  },
);

Category sweets = Category(
  const Text(
    "Sweets",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/sweets.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Sweets");
        },
      ),
    );
  },
);

Category grainsNoodles = Category(
  const Text(
    "Grains & Noodles",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/grains.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Grains & Noodles");
        },
      ),
    );
  },
);

Category canned = Category(
  const Text(
    "Canned Foods",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/can.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Canned Foods");
        },
      ),
    );
  },
);

Category pet = Category(
  const Text(
    "Pet Food",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/pet.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Pet Food");
        },
      ),
    );
  },
);

Category plus = Category(
  const Text(
    "Plus",
    style: TextStyle(color: Colors.white, fontSize: 20),
  ),
  Image.asset(
    'assets/categories/other.png',
    scale: 15,
  ),
  (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ItemListPage("Plus");
        },
      ),
    );
  },
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
