import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/dispimage.dart';

class Cameraholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.photo(),
      onMediaCaptureEvent: (event) {
        switch ((event.status, event.isPicture)) {
          case (MediaCaptureStatus.capturing, true):
            debugPrint('Capturing picture...');
          case (MediaCaptureStatus.success, true):
            event.captureRequest.when(
              single: (single) async {
                debugPrint(
                    'Picture saved: ${(await single.file?.readAsBytes())?.length}');
                single.file?.readAsBytes().then((imagev) {
                  print(imagev.lengthInBytes);

                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Dispimage(image: Image.memory(imagev));
                      },
                    ),
                  );
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
      onMediaTap: (mediaCapture) {
        mediaCapture.captureRequest.when(single: (single) async {
          single.file?.readAsBytes().then((imagev) {
            print(imagev.lengthInBytes);

            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Dispimage(image: Image.memory(imagev));
                },
              ),
            );
          });

          //Navigator.push(context, MaterialPageRoute(builder: (context) {
          //  single.file!.readAsBytes().then((value) {
          //    return Dispimage(image: Image.memory(value));
          //  });
          //  if (single.file == null) return Text('hi');
          //}));
        });
      },
      bottomActionsBuilder: (state) => AwesomeBottomActions(
        state: state,
        left: AwesomeFlashButton(
          state: state,
        ),
        captureButton: AwesomeCaptureButton(
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
    ));
  }
}
