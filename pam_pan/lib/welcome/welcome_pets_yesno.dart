import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/welcome/welcome_notif_duration.dart';
import 'package:pam_pan/welcome/welcome_pets_which.dart';

class WelcomePetsYesNo extends StatefulWidget {
  const WelcomePetsYesNo({super.key});

  @override
  State<WelcomePetsYesNo> createState() => _WelcomePetsYesNoState();
}

class _WelcomePetsYesNoState extends State<WelcomePetsYesNo> {
  String selectedOption = '';

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void continueAction() {
    if (selectedOption == 'Yes') {
      Navigator.push(
        context,
        CupertinoPageRoute(
          allowSnapshotting: false,
          builder: (context) => const WelcomePetsWhich(),
        ),
      );
    } else if (selectedOption == 'No') {
      Navigator.push(
        context,
        CupertinoPageRoute(
          allowSnapshotting: false,
          builder: (context) => const WelcomeNotifDuration(),
        ),
      );
    }
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
              SizedBox(height: MediaQuery.of(context).size.width * 0.25),
              // const Text(
              //   "Pam wants to know more about you!",
              //   style: TextStyle(fontSize: 20),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 8),
              const Text(
                "Do you have any pets?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              OptionButton(
                text: "Yes",
                isSelected: selectedOption == "Yes",
                onPressed: () => selectOption("Yes"),
              ),
              const SizedBox(height: 20),
              OptionButton(
                text: "No",
                isSelected: selectedOption == "No",
                onPressed: () => selectOption("No"),
              ),
              const SizedBox(height: 20),
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
        onPressed: selectedOption.isNotEmpty ? continueAction : null,
        // onPressed: () {},
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

class OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
