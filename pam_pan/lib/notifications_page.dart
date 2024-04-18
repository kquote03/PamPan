import 'package:flutter/material.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key, required this.payload});
  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text("Notifications Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(payload),
      ),
    );
  }
}
