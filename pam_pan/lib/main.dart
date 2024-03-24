import 'package:flutter/material.dart';
import 'package:pam_pan/page_skeleton.dart';
import 'package:pam_pan/ocr.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Recognition Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MainScreen()));
}
