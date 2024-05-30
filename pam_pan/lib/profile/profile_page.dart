import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/profile/about_pam_page.dart';
import 'package:pam_pan/profile/USELESS_payment_methods_page.dart';
import 'OLD_edit_profile_page.dart';
import 'package:appwrite/appwrite.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/bottom_bar.dart';

User? user;
Account account = Account(client);

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _assignUser();
  }

  Future<void> _assignUser() async {
    user = await account.get();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 250, 240),
          title: const Text("Profile"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueGrey[700],
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    user?.email ?? "noll",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ),
                  );
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      return Colors.transparent;
                    },
                  ),
                ),
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: screenHeight * 0.3,
                ),
              ),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentMethod(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.payments_outlined,
                          size: 20,
                          color: Color.fromARGB(255, 34, 33, 33),
                        ),
                        label: const Align(
                          alignment: Alignment(-1.0, 0.0),
                          child: Text(
                            "Payment Options",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutPam(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.info_outline,
                          size: 20,
                          color: Color.fromARGB(255, 34, 33, 33),
                        ),
                        label: const Align(
                          alignment: Alignment(-1.0, 0.0),
                          child: Text(
                            "About PamPan",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.exit_to_app,
                          size: 20,
                          color: Color.fromARGB(255, 34, 33, 33),
                        ),
                        label: const Align(
                          alignment: Alignment(-1.0, 0.0),
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
