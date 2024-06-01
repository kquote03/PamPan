import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<List<String>> addedItems = [
  ["2024-05-16", "Item1", "750", "g"],
  ["2024-05-17", "Item2", "6", "items"],
  ["2024-05-18", "Item3", "4", "L"],
];

List<List<String>> expiredItems = [
  ["2023-05-16", "ItemA", "500", "g"],
  ["2023-05-17", "ItemB", "3", "items"],
  ["2023-05-18", "ItemC", "2", "L"],
];

List<List<String>> donations = [
  ["2024-04-16", "ItemX", "250", "mL"],
  ["2024-04-17", "ItemY", "1", "Kg"],
];

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  Text("Records",
             style: GoogleFonts.mukta(fontWeight: FontWeight.bold, fontSize: 25)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(icon: Icon(Icons.add_circle_outline), text: "Added Items"),
              Tab(
                  icon: Icon(Icons.warning_amber_outlined),
                  text: "Expired Items"),
              Tab(
                  icon: Icon(Icons.volunteer_activism_outlined),
                  text: "Donations"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildItemList(
                context, addedItems, const Color.fromARGB(255, 214, 201, 243)),
            _buildItemList(context, expiredItems,
                const Color.fromARGB(255, 214, 201, 243)),
            _buildItemList(
                context, donations, const Color.fromARGB(255, 214, 201, 243)),
          ],
        ),
      ),
    );
  }

  Widget _buildItemList(
      BuildContext context, List<List<String>> items, Color color) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          for (List<String> item in items)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item[1],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Quantity: ${item[2]} ${item[3]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          _formatDate(item[0]),
                          style: const TextStyle(fontSize: 14),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";
  }
}
