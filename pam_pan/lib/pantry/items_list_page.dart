import 'package:flutter/material.dart';
import 'package:pam_pan/notifications/expiry_test.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage(this.category, {super.key});

  final String category;

  @override
  State<ItemListPage> createState() => _ItemListPageState(category);
}

class _ItemListPageState extends State<ItemListPage> {
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

  _ItemListPageState(this.category);
  String category;

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
    );
  }
}
