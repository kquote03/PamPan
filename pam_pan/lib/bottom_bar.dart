import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/map_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/pantry/pantry.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      destinations: [
        NavigationDestination(
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.home,
              size: 35,
              color: Colors.black,
            ),
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MapPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.location_on,
              size: 35,
              color: Colors.black,
            ),
          ),
          label: 'Map',
        ),
        NavigationDestination(
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddItemPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Clarity.plus_circle_solid,
              size: 35,
              color: Colors.black,
            ),
          ),
          label: 'Camera',
        ),
        NavigationDestination(
          icon: IconButton(
            icon: const Icon(
              Icons.receipt,
              size: 35,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    // return const ItemListPage("the whatever category.");
                    return const Pantry();
                  },
                ),
              );
            },
          ),
          label: 'Pantry',
        ),
      ],
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 70,
      selectedIndex: 0,
      surfaceTintColor: const Color.fromARGB(255, 255, 255, 242),
      indicatorColor: const Color.fromARGB(255, 255, 255, 242),
    );
  }
}
