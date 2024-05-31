import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pam_pan/cameraholder.dart';
import 'package:pam_pan/dispimage.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/map_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/pantry/pantry.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      destinations: [
        NavigationDestination(
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
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
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MapPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.location_on,
              size: 35,
              color: Colors.black,
            ),
          ),
          label: 'Map',
        ),
        NavigationDestination(
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Cameraholder();
              }));
            },
            icon: const Icon(
              Icons.camera_enhance,
              size: 35,
              color: Colors.black,
            ),
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
            onPressed: () {
              //CameraAwesomeBuilder.awesome(
              //   saveConfig: SaveConfig.photo(),
              //   onMediaTap: (mediaCapture) {
              //     mediaCapture.captureRequest.when(single: (single) async {
              //       Dispimage(
              //           image: Image.memory(await single.file!.readAsBytes()));
              //     });
              //   },
              // );

              //},
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    // return const ItemListPage("the whatever category.");
                    return const Pantry();
                  },
                ),
              );
            },
          ),
          label: 'Pantry',
        ),
      ],
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 70,
      selectedIndex: 0,
      surfaceTintColor: const Color.fromARGB(255, 255, 255, 242),
      indicatorColor: const Color.fromARGB(255, 255, 255, 242),
    );
  }
}
