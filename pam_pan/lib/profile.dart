import 'package:flutter/material.dart';
import 'package:pam_pan/paymentmethod.dart';
import 'editprofile.dart';

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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueGrey[700],
                    child: const CircleAvatar(
                      radius:
                          35,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
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
            const Expanded(child: SizedBox()),
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentMethod()),
                  );
                },
                icon: const Icon(
                  Icons.payments_outlined,
                  size: 20,
                  color: Color.fromARGB(255, 34, 33, 33),
                ),
                label: const Text(("Payment Options"),
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 34, 33, 33),
                      fontWeight: FontWeight.bold,
                    ))),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline,
                size: 20,
                color: Color.fromARGB(255, 34, 33, 33),
              ),
              label: const Text(
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
                size: 20,
                color: Color.fromARGB(255, 34, 33, 33),
              ),
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
