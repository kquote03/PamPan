import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Stored Payment Methods',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.storage,
                  size: 17,
                  color: Color.fromARGB(255, 34, 33, 33),
                ),
                label: const Text(
                  ('Stored Payment Methods                 '),
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Color.fromARGB(255, 34, 33, 33),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(150, 50),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Add payment method',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.credit_card,
                  size: 17,
                  color: Color.fromARGB(255, 34, 33, 33),
                ),
                label: const Text(
                  ('Credit Card                                         '),
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Color.fromARGB(255, 34, 33, 33),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(150, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
