import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pam_pan/MiriamMap/miriam_map.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';

final databases = Databases(client);

List<List<String>> items = [[]];

  void query() async {
    var documents = await databases.listDocuments(
        databaseId: '6650884f00137e1b1fcd',
        collectionId: '6650886f0027a739c072',
        queries: [
          Query.select(["name", "quantity"])
        ]);

    for (var i in documents.documents) {
      items.add([i.data['name'], i.data['quantity'].toString()]);
      print([i.data['name'], i.data['quantity'].toString()]);
    }
    print(items);
  }

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

final realtime = Realtime(client);

final subscription = realtime.subscribe([
  'databases.6650884f00137e1b1fcd.collections.6650886f0027a739c072.documents'
]);

class _RecordsState extends State<Records> {
  void refresh() {
    if (items[0].isEmpty) {
      setState(() {
        addItemsPage = const Center(
          child: Text("No Items."),
        );
      });
    } else {
      print(items);
      setState(() {
        addItemsPage = SingleChildScrollView(
          child: Column(
            children: [
              for (List<String> item in items)
                SizedBox(
                  height: 45,
                  child: Card(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(item[1]),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7),
                          Text(item[0]),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      });
    }
  }

  late Widget addItemsPage;

  @override
  void initState() {
    if (items[0].isEmpty) {
      addItemsPage = const Center(
        child: Text("No Items."),
      );
    } else {
      addItemsPage = SingleChildScrollView(
        child: Column(
          children: [
            for (List<String> item in items)
              SizedBox(
                height: 45,
                child: Card(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item[1]),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7),
                        Text(item[0]),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    }
    addItemsPage = const Center(
      child: Text("No Items."),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  query();
    subscription.stream.listen((response) {
      // Callback will be executed on all account events.
      print(response);
      refresh();
    });
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 250, 240),
          title: const Text("Records"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: const TabBar(tabs: [
            Tab(text: "Added Items"),
            // Tab(text: "Expired Items"),
            // Tab(text: "Donations")
          ]),
        ),
        body: TabBarView(
          children: [
            addItemsPage,
            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       for (List<String> item in items)
            //         SizedBox(
            //           height: 45,
            //           child: Card(
            //             child: Center(
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(item[1]),
            //                   SizedBox(
            //                       width:
            //                           MediaQuery.of(context).size.width * 0.7),
            //                   Text(item[0]),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       for (List<String> item in items)
            //         SizedBox(
            //           height: 45,
            //           child: Card(
            //             child: Center(
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(item[1]),
            //                   SizedBox(
            //                       width:
            //                           MediaQuery.of(context).size.width * 0.7),
            //                   Text(item[0]),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color.fromARGB(255, 255, 250, 240),
          destinations: [
            NavigationDestination(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MiriamMap();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.location_on,
                    size: 35, color: Colors.black),
              ),
              label: 'Map',
            ),
            NavigationDestination(
              icon: IconButton(
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
                icon: const Icon(Clarity.plus_circle_solid,
                    size: 35, color: Colors.black),
              ),
              label: 'Camera',
            ),
            NavigationDestination(
              icon: IconButton(
                icon: const Icon(
                  Icons.receipt,
                  size: 35,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              label: 'Records',
            ),
          ],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 70,
          // onDestinationSelected: (value) {},
          selectedIndex: 0,
          surfaceTintColor: const Color.fromARGB(255, 255, 255, 242),
          indicatorColor: const Color.fromARGB(255, 255, 255, 242),
        ),
      ),
    );
  }
}
