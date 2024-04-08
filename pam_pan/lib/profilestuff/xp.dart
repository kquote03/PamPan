import 'package:flutter/material.dart';

class XPBarPage extends StatefulWidget {
 final int userPoints; 
  final Key? key; 
  const XPBarPage({required this.userPoints, this.key}) : super(key: key);
  @override
  State<XPBarPage> createState() => _XPBarPageState();
}

class _XPBarPageState extends State<XPBarPage> {
  int userPoints = 0;

  @override
  void initState() {
    super.initState();
    userPoints = widget.userPoints;
  }

  void updateUserPoints() {
    setState(() {
      userPoints += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XP Bar Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: userPoints / 100,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 20),
            // User points
            Text(
              'User Points: $userPoints',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            // Button to gain points
            ElevatedButton(
              onPressed: updateUserPoints,
              child: const Text('Gain 10 Points'),
            ),
          ],
        ),
      ),
    );
  }
}
