import 'package:flutter/material.dart';
import 'package:pam_pan/notifications/expiry_test.dart';

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
                                    width: MediaQuery.of(context).size.width *
                                        0.7),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.7),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.7),
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
          )),
    );
  }
}
