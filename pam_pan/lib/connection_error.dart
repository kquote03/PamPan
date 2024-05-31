import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Icon(
          Icons.wifi_off,
          size: 100,
        ),
      ),
    );
  }
}
