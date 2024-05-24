import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/welcome/welcome_allergens.dart';


class WelcomeName extends StatefulWidget {
  const WelcomeName({super.key, required this.client});

  final Client client;

  @override
  State<WelcomeName> createState() => _WelcomeNameState();
}

class _WelcomeNameState extends State<WelcomeName> {
  final TextEditingController _controllerWelcomeName = TextEditingController();


  @override
  void dispose() {
    _controllerWelcomeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final client = widget.client;
Account account = Account(client);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text(
                  //   "Pam wants to know more about you!",
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //   textAlign: TextAlign.center,
                  // ),
                  const SizedBox(height: 8),
                  const Text(
                    "What would you like Pam to call you?",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controllerWelcomeName,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        fillColor: Colors.grey[200],

                        // labelText: '',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 25),
          backgroundColor: const Color.fromARGB(218, 255, 255, 255),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.75, 50),
        ),
        onPressed: () async {
    await account.createEmailPasswordSession(email: "email@example.com", password: "password123");
User result = await account.get();
print(result.email);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const WelcomeAllergens();
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
