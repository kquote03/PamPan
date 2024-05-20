import 'package:flutter/material.dart';
import 'package:pam_pan/welcome/welcome_pets_yesno.dart';

List<String> allergens = [
  "None",
  "Milk",
  "Eggs",
  "Fish",
  "Shellfish",
  "Nuts",
  "Wheat",
  "Soybean",
];

class WelcomeAllergens extends StatefulWidget {
  const WelcomeAllergens({super.key});

  @override
  State<WelcomeAllergens> createState() => _WelcomeAllergensState();
}

class _WelcomeAllergensState extends State<WelcomeAllergens> {
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
              const SizedBox(height: 15),
              const Text(
                "Pam wants to know more about you!",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "What allergens, if any, are you sensitive to?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              for (String allergen in allergens)
                GestureDetector(
                  onTap: () => toggleAllergen(allergen),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: selectedAllergens.contains(allergen)
                          ? Colors.blue
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      allergen,
                      style: TextStyle(
                        color: selectedAllergens.contains(allergen)
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
                return const WelcomePetsYesNo();
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
