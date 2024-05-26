import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/bottom_bar.dart';

class MiriamMap extends StatefulWidget {
  const MiriamMap({super.key});

  @override
  State<MiriamMap> createState() => _MiriamMapState();
}

class _MiriamMapState extends State<MiriamMap> {
  final mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text('Map'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                mapController: mapController,
                options: const MapOptions(
                  initialCenter: LatLng(24.2006, 55.6760),
                  initialZoom: 15,
                  maxZoom: 20,
                  minZoom: 3,
                ),
                children: [
                  openStreetTileLater,
                  const MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(24.2006, 55.6760),
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.my_location,
                          size: 60,
                          color: Color.fromARGB(255, 70, 143, 240),
                        ),
                      ),
                      Marker(
                        point: LatLng(24.183219401912982,
                            55.74473099613543), //Animal Rescue Shelter
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        point: LatLng(24.2155592130245,
                            55.625024021137264), //Royal Veterinary Center
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        point: LatLng(24.225803490637634,
                            55.69269642907965), //Emirates Red Crescent 1
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        point: LatLng(
                            24.17628679906427, 55.73407862325447), //Al Ain Zoo
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        point: LatLng(24.260274013318963,
                            55.72617744172498), //Emirates Red Crescent Al Ain Center
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        point: LatLng(
                            24.183341980132326, 55.71060773809221), //Mosque
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        point: LatLng(24.185409004481194,
                            55.716414595227626), //Mosque Falaj Hazaa
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        point: LatLng(24.206352450050343,
                            55.75743206134902), //St. Mary's Catholic Church Al-Ain
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_pin,
                          size: 60,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

TileLayer get openStreetTileLater => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
