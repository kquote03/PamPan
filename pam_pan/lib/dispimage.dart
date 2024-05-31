import 'package:flutter/material.dart';

class Dispimage extends StatelessWidget {
  final Image image;
  const Dispimage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: image.image),
    );
  }
}
