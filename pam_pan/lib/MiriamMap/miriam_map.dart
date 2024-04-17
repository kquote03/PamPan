import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';

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
        title: Text(ButtonContentsManager.pageLabels[2]),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(children: [
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
                const MarkerLayer(markers: [
                  Marker(
                    point: LatLng(24.2006, 55.6760),
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
                    point: LatLng(24.2006, 55.6760),
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.location_pin,
                      size: 60,
                      color: Colors.red,
                    ),
                  )
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

TileLayer get openStreetTileLater => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
