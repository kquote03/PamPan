import 'package:flutter/material.dart';
import 'package:pam_pan/profile/about_pam_page.dart';
import 'package:pam_pan/profile/payment_methods_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int points = 0;
  int nextLevelThreshold = 100;
  double progressValue = 0.0;
  int level = 0;

  void addPoints() {
    setState(() {
      points += 10;
      if (points >= nextLevelThreshold) {
        level++;
        nextLevelThreshold = (level + 1) * 100;
        progressValue = 0.0;
      } else {
        progressValue = points / nextLevelThreshold;
      }
    });
  }

  void subtractPoints() {
    setState(() {
      points -= 10;
      if (points < 0) points = 0;
      if (points < level * 100) {
        level--;
        if (level < 0) level = 0;
        nextLevelThreshold = (level + 1) * 100;
      }
      progressValue = points / nextLevelThreshold;
    });
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
                  const Text(
                    "'user'",
                    style: TextStyle(
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
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
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
              LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                'Level: $level',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      addPoints();
                    },
                    child: const Text('+10 points'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: subtractPoints,
                    child: const Text('-10 points'),
                  ),
                ],
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
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return const Color.fromARGB(255, 219, 219, 219);
                            },
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
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
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return const Color.fromARGB(255, 219, 219, 219);
                            },
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
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
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return const Color.fromARGB(255, 219, 219, 219);
                            },
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
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
      ),
    );
  }
}
