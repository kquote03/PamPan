import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pam_pan/MiriamMap/miriam_map.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/notifications/expiry_test.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/bottom_bar.dart';

/* TODO: REMOVE THIS TEMPORARY TEST ARRAY */
List<List<String>> items = [
  ["2024-05-16", "Item1", "750", "g"],
  ["2024-05-17", "Item2", "6", "items"],
  ["2024-05-18", "Item3", "4", "L"],
  ["2024-05-19", "Item4", "350", "mL"],
  ["2024-05-20", "Item5", "2", "Kg"],
];

class ItemListPage extends StatefulWidget {
  const ItemListPage(this.category, {super.key});

  final String category;

  @override
  // ignore: no_logic_in_create_state
  State<ItemListPage> createState() => _ItemListPageState(category);
}

class _ItemListPageState extends State<ItemListPage> {
  _ItemListPageState(this.category);
  String category;

  List<Widget> _buildList(int keyIndex) {
    List<Widget> list = [];

    list.add(
      Row(
        children: <Widget>[
          Row(
            children: [
              Row(
                children: [
                  const Text(
                    '''
Expiry Date:
Quantity/Amount:
''',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(),
                  Text(
                    '''
        ${items[keyIndex][0]}
        ${items[keyIndex][2]} ${items[keyIndex][3]}
        ''',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: Text(category),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Clarity.plus_circle_solid,
                size: 30, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddItemPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 250, 240),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int keyIndex) {
            return Card(
              color: const Color.fromARGB(255, 71, 50, 39),
              child: ExpansionTile(
                enableFeedback: true,
                iconColor: Colors.white,
                childrenPadding: const EdgeInsets.only(left: 20),
                title: Text(
                  items[keyIndex][1],
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                children: <Widget>[
                  Column(
                    children: _buildList(keyIndex),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
