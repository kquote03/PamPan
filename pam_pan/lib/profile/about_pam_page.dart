import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pam_pan/MiriamMap/miriam_map.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/records.dart';

class AboutPam extends StatelessWidget {
  const AboutPam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text('About Us'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: const Text(
            'PamPan is a food waste management system, giving you the ability to scan barcodes and expiry dates and store them in the system. PamPan lets you categorize your food items and reminds you when those food items are about to expire. PamPan also provides you with locations that you can donate your food to, as well as the ability to donate money.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        destinations: [
          NavigationDestination(
            icon: IconButton(
              onPressed: () {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MiriamMap();
                    },
                  ),
                );
              },
              icon:
                  const Icon(Icons.location_on, size: 35, color: Colors.black),
            ),
            label: 'Map',
          ),
          NavigationDestination(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddItemPage();
                    },
                  ),
                );
              },
              icon: const Icon(Clarity.plus_circle_solid,
                  size: 35, color: Colors.black),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Records();
                    },
                  ),
                );
              },
            ),
            label: 'Records',
          ),
        ],
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 70,
        // onDestinationSelected: (value) {},
        selectedIndex: 0,
        surfaceTintColor: const Color.fromARGB(255, 255, 255, 242),
        indicatorColor: const Color.fromARGB(255, 255, 255, 242),
      ),
    );
  }
}
