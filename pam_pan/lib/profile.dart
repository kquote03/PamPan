import 'package:flutter/material.dart';
import 'package:pam_pan/paymentmethod.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.blueGrey[700],
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  "'user'",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 400),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentMethod()),
                  );
                },
                child: const Text(("Payment Options"),
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 34, 33, 33),
                      fontWeight: FontWeight.bold,
                    ))),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: const Text(
                "About PamPan",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 34, 33, 33),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                    Icons.exit_to_app,
                    size: 17,
                    color: Color.fromARGB(255, 34, 33, 33),),
              label: const Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
