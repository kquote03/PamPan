import 'dart:convert';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/dispimage.dart';
import 'package:pam_pan/firebase_ai.dart';
import 'package:pam_pan/pantry/add_item_page.dart';
import 'package:pam_pan/pantry/food_item.dart';

const prompt = """
      Only reply back with a properly formatted JSON response. starting with a curly brace immediately.
      Fill the following JSON structure with data extracted from the image.

      {
      "itemName": "",
      "expiryDate": "",
      "category": "",
      "measurementUnit": ""
      }

      Where itemName is the name (or brand) of the food item being scanned, the
      expiryDate is the expiry date of the food item from the image(s) and it is in the strict format of YYYY-MM-DD,
      the category is just the one-word category of the food (for example a bag of lays is categorized as snacks),
      and measurementUnit is the unit of measurement of the quantity, for this please only pick one from ['g', 'kg', 'l', 'ml', 'pieces']
      """;

class Cameraholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.photo(),
      // The actual thing that happens when you click the shutter button
      onMediaCaptureEvent: (event) {
        switch ((event.status, event.isPicture)) {
          case (MediaCaptureStatus.capturing, true):
            debugPrint('Capturing picture...');
          case (MediaCaptureStatus.success, true):
            event.captureRequest.when(
              single: (single) async {
                // Show progress bar i guess
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    allowSnapshotting: false,
                    builder: (context) {
                      return const Scaffold(
                        body: Center(
                          child: SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text("🔎 🧶 Pam is noting down the details...")
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );

                debugPrint(
                    'Picture size: ${(await single.file?.readAsBytes())?.length}');

                single.file?.readAsBytes().then((imagev) async {
                  print(imagev.lengthInBytes);
                  Map<String, dynamic> itemJson = json.decode(await FirebaseAI()
                      .oneImageBytesTextWithoutStream(
                          prompt, imagev, 'image/*'));
                  print(itemJson);
                  FoodItem foodItem = FoodItem.fromGeminiJson(itemJson);

                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      allowSnapshotting: false,
                      builder: (context) {
                        return AddItemPage(
                          fooditem: foodItem,
                        );
                      },
                    ),
                  );

                  //Navigator.pop(context);
                  //Navigator.push(
                  //  context,
                  //  CupertinoPageRoute(
                  // allowSnapshotting: false,
                  //    builder: (context) {
                  //      return Dispimage(image: Image.memory(imagev));
                  //    },
                  //  ),
                  //);
                });
              },
              multiple: (multiple) {
                multiple.fileBySensor.forEach((key, value) {
                  debugPrint('multiple image taken: $key ${value?.path}');
                });
              },
            );
          case (MediaCaptureStatus.failure, true):
            debugPrint('Failed to capture picture: ${event.exception}');
          default:
            debugPrint('Unknown event: $event');
        }
      },

      middleContentBuilder: (state) {
        return Column(
          children: [
            const Spacer(),
            // Use a Builder to get a BuildContext below AwesomeThemeProvider widget
            Builder(builder: (context) {
              return Container(
                // Retrieve your AwesomeTheme's background color
                color: AwesomeThemeProvider.of(context)
                    .theme
                    .bottomActionsBackgroundColor,
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(
                      "💡 Tip: Make sure the expiry date is clearly visible!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        );
      },

      bottomActionsBuilder: (state) => AwesomeBottomActions(
        state: state,
        left: AwesomeFlashButton(
          state: state,
        ),
        right: AwesomeCameraSwitchButton(
          state: state,
          scale: 1.0,
          onSwitchTap: (state) {
            state.switchCameraSensor(
              aspectRatio: state.sensorConfig.aspectRatio,
            );
          },
        ),
      ),

      //onMediaTap: (mediaCapture) {
      //  mediaCapture.captureRequest.when(single: (single) async {
      //    single.file?.readAsBytes().then((imagev) {
      //      print(imagev.lengthInBytes);

      //      Navigator.pop(context);
      //      Navigator.push(
      //        context,
      //        CupertinoPageRoute(
      // allowSnapshotting: false,
      //          builder: (context) {
      //            return Dispimage(image: Image.memory(imagev));
      //          },
      //        ),
      //      );
      //    });

      //    //Navigator.push(context, CupertinoPageRoute(allowSnapshotting: false,builder: (context) {
      //    //  single.file!.readAsBytes().then((value) {
      //    //    return Dispimage(image: Image.memory(value));
      //    //  });
      //    //  if (single.file == null) return Text('hi');
      //    //}));
      //  });
      //},
    ));
  }
}
