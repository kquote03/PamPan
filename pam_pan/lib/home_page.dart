import 'dart:io';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pam_pan/login%20and%20signup/login.dart';
import 'package:pam_pan/newcal.dart';
import 'package:pam_pan/notifications/tips.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/pantry/category_edit_page.dart';
import 'package:pam_pan/pantry/food_item.dart';
import 'package:pam_pan/payment_page.dart';
import 'package:pam_pan/profile/help.dart';
import 'package:pam_pan/notifications/local_notifications.dart';
import 'package:pam_pan/notifications/notifications_page.dart';
import 'package:home_widget/home_widget.dart';
import 'package:pam_pan/records.dart';
import 'bottom_bar.dart';

//Taken from expiry_test
DateTime stringToDate(String date) {
  return DateTime.parse(date);
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

List<List<String>> sortList(List<List<String>> list) {
  list.sort((a, b) => a[0].compareTo(b[0]));
  return list;
}

class HomePage extends StatefulWidget {
  HomePage({super.key});
  List<String> recentlyAddedItems = [];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appGroupId = 'group.pampan';
  String iOSWidgetName = 'pampan';
  int index = 0;

  Random random = Random();
  int _currentCarousel = 0;
  final CarouselController _carousalController = CarouselController();
  File? _profileImage;

  List<FoodItem> _recentlyAddedItems = [];
  String _recentlyAddedItem1 = "";
  String _recentlyAddedItem2 = "";
  String _recentlyAddedItem3 = "";
  String _recentlyAddedItem4 = "";

  _asyncQuery() async {
    List<FoodItem> fetchedItems = await getNearlyExpiredItems(limit: 4);
    setState(
      () {
        _recentlyAddedItems = fetchedItems;
        // for (int i = 0; i < widget.recentlyAddedItems.length; i++) {
        // widget.recentlyAddedItems[i] =
        //     "${_recentlyAddedItems[i].itemName!} ${_recentlyAddedItems[i].expiryDate!}";
        // }
        _recentlyAddedItem1 = _recentlyAddedItems[0].toString();
        _recentlyAddedItem2 = _recentlyAddedItems[1].toString();
        _recentlyAddedItem3 = _recentlyAddedItems[2].toString();
        _recentlyAddedItem4 = _recentlyAddedItems[3].toString();

        print(_recentlyAddedItems);
      },
    );
  }

  @override
  void initState() {
    HomeWidget.setAppGroupId(appGroupId);
    super.initState();
    listenNotifications();
    _asyncQuery();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(
        () {
          _profileImage = File(pickedFile.path);
        },
      );
    }
  }

  updateWidgetFun() {
    HomeWidget.saveWidgetData<String>('title', 'flutter');
    HomeWidget.saveWidgetData<String>('description', 'app dev');
    HomeWidget.updateWidget(iOSName: iOSWidgetName);
  }

  listenNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen(
      (event) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationsPage(payload: event),
          ),
        );
      },
    );
  }

  @override
  Widget build(context) {
    List<Widget> carouselItems = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _recentlyAddedItem1,
            style: GoogleFonts.homemadeApple(
                textStyle: const TextStyle(fontSize: 30)),
          ),
          Text(
            _recentlyAddedItem2,
            style: GoogleFonts.homemadeApple(
                textStyle: const TextStyle(fontSize: 30)),
          ),
          Text(
            _recentlyAddedItem3,
            style: GoogleFonts.homemadeApple(
                textStyle: const TextStyle(fontSize: 30)),
          ),
          Text(
            _recentlyAddedItem4,
            style: GoogleFonts.homemadeApple(
                textStyle: const TextStyle(fontSize: 30)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the new page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddItemPage()),
                  );
                },
                child: const Text('Add items'),
              ),
            ],
          ),
        ],
      ),
      const Text("text2"),
      Column(
        children: [
          const Text("text3"),
          ElevatedButton(
            onPressed: () {
              // Navigate to the new page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
            },
            child: const Text('Donate cashmonneh'),
          ),
        ],
      ),
      // const Text("text3"),
    ].asMap().entries.map(
      (entry) {
        int index = entry.key;
        Widget content = entry.value;
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 197, 234, 250),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(10, 10),
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [content],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 30,
              icon: _profileImage == null
                  ? const Icon(Icons.account_circle)
                  : CircleAvatar(
                      backgroundImage: FileImage(_profileImage!),
                    ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Text(
            DateFormat.MMMM().format(DateTime.now()),
            style: const TextStyle(fontSize: 20),
          ),
          IconButton(
            icon:
                const Icon(Icons.calendar_month, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NewCalendar();
                  },
                ),
              );
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.notifications, size: 35, color: Colors.black),
            onPressed: () {
              String randomTip = Tips.tips[random.nextInt(Tips.tips.length)][0];
              LocalNotifications.showPeriodicNotification(
                title: "Pam got some tips for you!",
                body: randomTip,
                payload: randomTip,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.cancel, size: 35, color: Colors.black),
            onPressed: () {
              LocalNotifications.cancelAll();
            },
          ),
          IconButton(
            icon:
                const Icon(Icons.notifications, size: 35, color: Colors.black),
            onPressed: () {
              sortList(items);
              for (int i = 0; i < items.length; i++) {
                LocalNotifications.showScheduleNotification(
                  id: i,
                  title: "Uhoh! ${items[i][1]} is about to expire!",
                  body: "Quick! It will expire on ${items[i][0]}",
                  payload: "Scheduled payload",
                  minutes:
                      daysBetween(DateTime.now(), stringToDate(items[i][0])),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pantry View',
              style:
                  GoogleFonts.mukta(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            CarouselSlider(
              carouselController: _carousalController,
              options: CarouselOptions(
                height: 275,
                // aspectRatio: 16 / 9,
                viewportFraction: 0.95,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentCarousel = index;
                    },
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
              items: carouselItems,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselItems.asMap().entries.map(
                (carousel) {
                  return GestureDetector(
                    onTap: () =>
                        _carousalController.animateToPage(carousel.key),
                    child: Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                          _currentCarousel == carousel.key ? 0.9 : 0.4,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: 50,
            ),
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 0.95,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                scrollDirection: Axis.horizontal,
              ),
              items: [1].map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 197, 234, 250),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(10, 10),
                              blurStyle: BlurStyle.normal,
                            ),
                          ],
                        ),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: 1500,
            ),
            const Text("yo"),
            ElevatedButton(
              onPressed: () => updateWidgetFun(),
              child: const Text('Update'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: _profileImage == null
                                  ? null
                                  : DecorationImage(
                                      image: FileImage(_profileImage!),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            child: _profileImage == null
                                ? const Icon(
                                    Icons.account_circle,
                                    size: 40,
                                    color: Colors.grey,
                                  )
                                : null,
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Insert username here',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Insert email here',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Notifications: 5 days before expiry date.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const EditProfilePage()),
                    //     );
                    //   },
                    //   child: const Text('Edit Profile'),
                    // ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            ListTile(
              title: const Text('Records'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Records();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Edit Categories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CategoryListPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HelpPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Log out',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                account.deleteSession(sessionId: 'current');
                while (Navigator.canPop(context)) Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
