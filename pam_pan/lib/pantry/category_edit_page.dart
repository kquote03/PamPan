import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/bottom_bar.dart';
import 'package:pam_pan/pantry/food_item.dart';

final realtime = Realtime(client);
final subscription = realtime.subscribe([
  'databases.6650884f00137e1b1fcd.collections.665089ef003013ad1543.documents'
]);

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  _CategoryListPageState();
  List<String> categories = [];

  @override
  void initState() {
    _asyncQuery();
    super.initState();
  }

  _asyncQuery() async {
    var fetchedCategories = await getCategories();
    setState(() {
      categories = fetchedCategories;
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
                  /*const Text(
                    '''
Expiry Date:
Quantity/Amount:
''',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(),
                  Text(
                    '''
                    ${items[keyIndex].expiryDate} 
                    ''',
                    style: const TextStyle(color: Colors.white),
                  ),*/
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
        title: const Text("Current categories"),
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
                    return AddItemPage();
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
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int keyIndex) {
            return Card(
              color: const Color.fromARGB(255, 71, 50, 39),
              child: ExpansionTile(
                enableFeedback: true,
                iconColor: Colors.white,
                childrenPadding: const EdgeInsets.only(left: 20),
                title: Text(
                  categories[keyIndex] ?? "",
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                children: <Widget>[
                  Row(children: [
                    Column(
                      children: _buildList(keyIndex),
                    ),
                    IconButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(
                        //  builder: (context) {
                        //    print(categories[keyIndex]);
                        //  },
                        //));
                      },
                      icon: const Icon(Icons.edit),
                      color: Colors.white,
                    ),
                    IconButton(
                        onPressed: () {
                          deleteItemById(categories[keyIndex]);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ))
                  ]),
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
