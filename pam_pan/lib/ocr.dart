import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: "OCR Example",
    home: MainScreen(),
  );
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isPermissionGranted = false;
  late final Future<void> _future;

  @override
  void initState() {
    super.initState();
    _future = _requestCameraPermission();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
              body: Center(
            child: Text(
                _isPermissionGranted
                    ? "Camera Permission Granted"
                    : "Not granted",
                textDirection: TextDirection.ltr),
          )),
        );
      },
    );
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isPermissionGranted = status == PermissionStatus.granted;
  }
}
