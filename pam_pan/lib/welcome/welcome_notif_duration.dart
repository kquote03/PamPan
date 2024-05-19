import 'package:flutter/material.dart';
import 'package:pam_pan/page_skeleton.dart';
import 'package:wheel_picker/wheel_picker.dart';

class WelcomeNotifDuration extends StatefulWidget {
  const WelcomeNotifDuration({super.key});

  @override
  State<WelcomeNotifDuration> createState() => _WelcomeNotifDurationState();
}

class _WelcomeNotifDurationState extends State<WelcomeNotifDuration> {
  final _wheelPickerController = WheelPickerController(itemCount: 32);
  final textStyle = const TextStyle(fontSize: 32.0, height: 1.5);

  @override
  void dispose() {
    _wheelPickerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.15),
            const Text(
              "Pam wants to know more about you!",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                "How many days before an expiry date do you want Pam to remind you of it?",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            WheelPicker(
              builder: (context, index) => Text("$index", style: textStyle),
              controller: _wheelPickerController,
              selectedIndexColor: Colors.blue,
              style: WheelPickerStyle(
                size: 300,
                itemExtent: textStyle.fontSize! * textStyle.height!,
                squeeze: 1.25,
                diameterRatio: .8,
                surroundingOpacity: .25,
                magnification: 1.2,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 25),
          backgroundColor: const Color.fromARGB(218, 242, 174, 174),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.75, 50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return const PageSkeleton();
                },
                fullscreenDialog: true),
          );
        },
        child: const Text(
          "Continue",
        ),
      ),
    );
  }
}
