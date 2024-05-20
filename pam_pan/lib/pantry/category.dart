import 'package:flutter/material.dart';
import 'package:pam_pan/pantry/items_list_page.dart';

class Category {
  final Text nameText;
  final List<Widget>? items;
  final Widget icon;
  final void Function()? goesTo;

  Category(this.nameText, this.icon, this.goesTo, {this.items});

  // void addItem
}

Category bread = Category(
  const Text(
    "Bread & Pastries",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/bread.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Bread & Pastries",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category dairy = Category(
  const Text(
    "Dairy & Eggs",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/dairy_eggs.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Dairy & Eggs",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category cheese = Category(
  const Text(
    "Cheese",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/fromage.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Cheese",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category chicken = Category(
  const Text(
    "Chicken",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/chicken.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Chicken",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category meats = Category(
  const Text(
    "Meats",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/meat.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Meats",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category fruits = Category(
  const Text(
    "Fruits",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/fruits.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Fruits",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category vegetables = Category(
  const Text(
    "Vegetables",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/veg.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Vegetables",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category fish = Category(
  const Text(
    "Fish & Seafood",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/fish.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Fish & Seafood",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

// ignore: non_constant_identifier_names
Category HSC = Category(
  const Text(
    "Herbs, Spices, & Condiments",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/herbs.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Herbs, Spices, & Condiments",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category nutsSeeds = Category(
  const Text(
    "Nuts & Seeds",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/nuts.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Nuts & Seeds",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category drinksBeverages = Category(
  const Text(
    "Drinks & Beverages",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/bevs.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Drinks & Beverages",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category sweets = Category(
  const Text(
    "Sweets",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/sweets.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Sweets",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category grainsNoodles = Category(
  const Text(
    "Grains & Noodles",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/grains.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Grains & Noodles",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category canned = Category(
  const Text(
    "Canned Foods",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/can.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Canned Foods",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category pet = Category(
  const Text(
    "Pet Food",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/pet.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Pet Food",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
  },
);

Category plus = Category(
  const Text(
    "Plus",
    style: TextStyle(
      fontSize: 15,
    ),
    textAlign: TextAlign.center,
  ),
  Image.asset(
    'assets/categories/other.png',
    scale: 15,
  ),
  () {
    (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ItemListPage(
              Text(
                "Plus",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      );
    };
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
