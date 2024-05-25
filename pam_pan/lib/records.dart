import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pam_pan/MiriamMap/miriam_map.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/notifications/expiry_test.dart';
import 'package:pam_pan/pantry/add_item_page.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

final realtime = Realtime(client);

final subscription = realtime.subscribe(['databases.6650884f00137e1b1fcd.collections.6650886f0027a739c072.documents']);



class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    ExpiryTest().query();
subscription.stream.listen((response) {
    // Callback will be executed on all account events.
    print(response);
});
    return DefaultTabController(
      length: 3,
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
            Tab(text: "Expired Items"),
            Tab(text: "Donations")
          ]),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.7),
                              Text(item[0]),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SingleChildScrollView(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.7),
                              Text(item[0]),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SingleChildScrollView(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.7),
                              Text(item[0]),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
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
