import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:location/location.dart';
import 'package:pam_pan/consts.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/records.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

   Location _locationController = Location();


   static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848); 
   static const LatLng _kGooglePlex = LatLng(37.3346, -122.0090); 

  Map<PolylineId, Polyline> polylines = {};
  LatLng? _currentP;



  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) => {getPolylinePoints().then((coordinates) => {
      print(coordinates), 
    }),
    }, );
  }

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
      body: _currentP == null
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
            onMapCreated: ((GoogleMapController _controller) => _mapController.complete(_controller)),
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _pGooglePlex,
                zoom: 13,)
                markers: {
                Marker(
                    markerId: MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentP!,
                    ),
                Marker(
                    markerId: MarkerId("_sourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex),
                Marker(
                    markerId: MarkerId("_destinationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pApplePark),    
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }
                },
                polylines: Set<Polyline>.of(polylines.values),
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
              onPressed: () {},
              icon:
                  const Icon(Icons.location_on, size: 35, color: Colors.black),
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
              onPressed: () {
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
    );
  }
  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future; 
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition),); 
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
    } else {
      return;
    }

    _locationController.onLocationChanged.listen(
      (LocationData currentLocation) {
        if (currentLocation.latitude != null &&
            currentLocation.longitude != null) {
          setState(
            () {
              _currentP =
                  LatLng(currentLocation.latitude!, currentLocation.longitude!);
                   _cameraToPosition(_currentP!); 
            },
          );
        }
      },
    );
  }
  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = []; 
    PolylinePoints polylinePoints = PolylinePoints(); 
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(GOOGLE_MAPS_API_KEY, PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude), PointLatLng(_pAppleParkx.latitude, _pApplePark.longitude), travelMode: TravelMode.driving,); 
    if(result.points.isNotEmpty) {
      result.points.forEach(PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else{
      print(result.errorMessage);
    }
    return polylineCoordinates; 
  }
  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    Polyline id = PolylineId("poly") as Polyline; 
    Polyline polyline = Polyline(
    polylineId: id, 
    color: Colors.black,
    points: polylineCoordinates, 
    width: 8);
    setState(() {
      polylines(id) = polyline; 
    });
  }
}
