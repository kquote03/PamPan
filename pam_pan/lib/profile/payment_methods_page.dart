import 'package:flutter/material.dart';
import 'package:pam_pan/payment_page.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
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
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.storage,
                      size: 17,
                      color: Color.fromARGB(255, 34, 33, 33),
                    ),
                    label: const Align(
                      alignment: Alignment(-1.0, 0.0),
                      child: Text(
                        ('Stored Payment Methods'),
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Color.fromARGB(255, 34, 33, 33),
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          return const Color.fromARGB(255, 219, 219, 219);
                        },
                      ),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      minimumSize: WidgetStateProperty.all<Size>(
                        const Size(double.infinity, 50), // Adjust height here
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Add payment method',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const PaymentPage();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.credit_card,
                      size: 17,
                      color: Color.fromARGB(255, 34, 33, 33),
                    ),
                    label: const Align(
                      alignment: Alignment(-1.0, 0.0),
                      child: Text(
                        ('Credit Card'),
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Color.fromARGB(255, 34, 33, 33),
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          return const Color.fromARGB(255, 219, 219, 219);
                        },
                      ),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      minimumSize: WidgetStateProperty.all<Size>(
                        const Size(double.infinity, 50), // Adjust height here
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
