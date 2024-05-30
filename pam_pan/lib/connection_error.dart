import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: const Icon(
          Icons.wifi_off,
          size: 100,
        ));
  }
}
