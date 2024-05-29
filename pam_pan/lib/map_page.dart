import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:location/location.dart';
import 'package:pam_pan/bottom_bar.dart';
import 'package:pam_pan/consts.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Location _locationController = Location();

  //static const LatLng _pGooglePlex =
  //    LatLng(37.4223, -122.0848); //ill deal with these later
  //static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  static const LatLng _animalRescue =
      LatLng(24.274045415060066, 55.723430859715386);
  static const LatLng _animalClinic =
      LatLng(24.21383707793596, 55.62485235976167);
  static const LatLng _emiratesRedCrescent1 =
      LatLng(24.225490402081636, 55.69097981532366);
  static const LatLng _emiratesRedCrescent2 =
      LatLng(24.256517917521805, 55.741283642777795);
  static const LatLng _mosque1 = LatLng(24.182793892101056, 55.710478992060516);
  static const LatLng _mosque2 = LatLng(24.185565598092026, 55.717358732793436);

  Map<PolylineId, Polyline> polylines = {};
  LatLng _currentP = const LatLng(24.3455155, 54.5368051);

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
      (_) => {
        getPolylinePoints().then((coordinates) => {
              print(coordinates),
            }),
      },
    );
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
      body: GoogleMap(
        onMapCreated: ((GoogleMapController controller) {
          _controller.complete(controller);
        }),
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentP,
          zoom: 13,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("_currentLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _currentP!,
          ),
          const Marker(
              markerId: MarkerId("_animalRescueLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _animalRescue),
          const Marker(
              markerId: MarkerId("_animalClinicLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _animalClinic),
          const Marker(
              markerId: MarkerId("_redCrescentLocation1"),
              icon: BitmapDescriptor.defaultMarker,
              position: _emiratesRedCrescent1),
          const Marker(
              markerId: MarkerId("_redCrescentLocation2"),
              icon: BitmapDescriptor.defaultMarker,
              position: _emiratesRedCrescent2),
          const Marker(
              markerId: MarkerId("_mosque1Location"),
              icon: BitmapDescriptor.defaultMarker,
              position: _mosque1),
          const Marker(
              markerId: MarkerId("_mosque2Location"),
              icon: BitmapDescriptor.defaultMarker,
              position: _mosque2),
        },
        polylines: Set<Polyline>.of(polylines.values),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
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
              _cameraToPosition(_currentP);
            },
          );
        }
      },
    );
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(_currentP.latitude, _currentP.longitude),
      PointLatLng(
          _emiratesRedCrescent1.latitude, _emiratesRedCrescent1.longitude),
      //PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
      //PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
