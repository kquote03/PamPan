import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 250, 240),
          title: const Text("History"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: const TabBar(tabs: [
            Tab(text: "Added Items"),
            Tab(text: "Expired Items"),
            Tab(text: "Donations")
          ]),
        ),
        body: const TabBarView(
          children: [
            Placeholder(),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
