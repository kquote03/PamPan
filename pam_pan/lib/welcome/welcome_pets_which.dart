import 'package:flutter/material.dart';
import 'package:pam_pan/welcome/welcome_notif_duration.dart';

List<String> pets = [
  "Dog",
  "Cat",
  "Bird",
  "Fish",
  "Frog",
  "Turtle",
  "Lizard",
];

class WelcomePetsWhich extends StatefulWidget {
  const WelcomePetsWhich({super.key});

  @override
  State<WelcomePetsWhich> createState() => _WelcomePetsWhichState();
}

class _WelcomePetsWhichState extends State<WelcomePetsWhich> {
  List<String> selectedAllergens = [];

  void toggleAllergen(String allergen) {
    setState(() {
      if (selectedAllergens.contains(allergen)) {
        selectedAllergens.remove(allergen);
      } else {
        selectedAllergens.add(allergen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.15),
              // const Text(
              //   "Pam wants to know more about you!",
              //   style: TextStyle(fontSize: 20),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 8),
              const Text(
                "Which pets do you have?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              for (String pet in pets)
                GestureDetector(
                  onTap: () => toggleAllergen(pet),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: selectedAllergens.contains(pet)
                          ? Colors.blue
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      pet,
                      style: TextStyle(
                        color: selectedAllergens.contains(pet)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 25),
          backgroundColor: const Color.fromARGB(218, 255, 255, 255),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.75, 50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const WelcomeNotifDuration();
              },
            ),
          );
        },
        child: const Text(
          "Continue",
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 25,
      ),
    );
  }
}
