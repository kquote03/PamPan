import 'package:flutter/material.dart';
import 'package:pam_pan/bottom_bar.dart';

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
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
