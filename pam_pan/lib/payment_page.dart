import 'package:flutter/material.dart';
import 'package:pam_pan/data/app_bar_button_list_manager.dart';
import 'package:pam_pan/data/nav_button_list_manager.dart';
import 'package:pam_pan/data/nav_buttons_contents_manager.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  final NavButtonListManager navButtonList = NavButtonListManager();
  final NavButtonContentsManager navButtonContents = NavButtonContentsManager();
  final AppBarButtonListManager appBarButtonList = AppBarButtonListManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Payment Page'),
            leading: appBarButtonList.getlist()[0],
            actions: [
              appBarButtonList.getlist()[1],
              appBarButtonList.getlist()[2],
            ],
            backgroundColor: const Color.fromARGB(255, 178, 94, 91),
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  "Donating to help the hungry. A worthy endevour.",
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  "Our mission here at PamPan is to reduce food waste so there is more for everybody. That is why any donation you make through us would go straight to the United Nation's World Food Programme (WFP), which aims to distribute food to as many hungry people as possible, across the globe.",
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            //maybe we can make this a drop down menu like the real expiration payment pages
                            decoration: InputDecoration(
                              labelText: 'Expiration Date',
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'CVV',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Process Donation'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            destinations: navButtonList.getList(),
          )),
    );
  }
}
