import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/bottom_bar.dart';

final databases = Databases(client);
final realtime = Realtime(client);
final subscription = realtime.subscribe([
  'databases.6650884f00137e1b1fcd.collections.6650886f0027a739c072.documents'
]);

Future<List<List<String>>> query() async {
  var documents = await databases.listDocuments(
      databaseId: '6650884f00137e1b1fcd',
      collectionId: '6650886f0027a739c072',
      queries: [
        Query.select(["name", "quantity", "expiryDate"])
      ]);
  List<List<String>> items = [];

  for (var i in documents.documents) {
    items.add(
        [i.data['name'], i.data['quantity'].toString(), i.data['expiryDate']]);
  }
  return items;
}

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
  List<List<String>> items = [];

  @override
  void initState() {
    _asyncQuery();
    super.initState();
  }

  _asyncQuery() async {
    List<List<String>> fetchedItems = await query();
    setState(() {
      items = fetchedItems;
    });
  }

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
        ${items[keyIndex][2]} 
        ${items[keyIndex][1]}
       ''',
                    //${items[keyIndex][2]} ${items[keyIndex][3]}
                    //''',
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
    subscription.stream.listen((response) {
      // Callback will be executed on all account events.
      setState(() {
        _asyncQuery();
      });
    });
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
                  items[keyIndex][0],
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
