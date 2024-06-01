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
  List<Map<String, String>> categories = [];

  TextEditingController _categoryNameController = TextEditingController();

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
              _showItemAddCatalog(context);
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
              color: const Color.fromARGB(255, 214, 201, 243),
              child: ExpansionTile(
                enableFeedback: true,
                iconColor: Colors.black,
                childrenPadding: const EdgeInsets.only(left: 20),
                title: Text(
                  categories[keyIndex]['name'] ?? "",
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                children: <Widget>[
                  Center(
                    child: Row(children: [
                      //Column(
                      //  children: _buildList(keyIndex),
                      //),
                      IconButton(
                        onPressed: () {
                          _showItemEditCatalog(
                              context, categories[keyIndex]['id'] ?? "");
                        },
                        icon: const Icon(Icons.edit),
                        color: Colors.black,
                      ),
                      IconButton(
                          onPressed: () {
                            deleteCategoryById(categories[keyIndex]['id']);
                            initState();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ))
                    ]),
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

  _showItemEditCatalog(context, String id) {
    print(id);
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Insert new name",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Category Name'),
                    controller: _categoryNameController,
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 1)),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await updateCategory(id, _categoryNameController.text);
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text("Ok"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _showItemAddCatalog(context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Insert category name",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Category Name'),
                    controller: _categoryNameController,
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 1)),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        createCategory(_categoryNameController.text);
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text("Ok"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
