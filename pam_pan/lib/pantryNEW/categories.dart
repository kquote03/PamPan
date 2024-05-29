import 'package:flutter/material.dart';
import 'package:pam_pan/pantryNEW/colors.dart';

class Catogeries extends StatelessWidget {
  final Color color;
  final String text;
  final String images;
  const Catogeries(
      {super.key,
      required this.color,
      required this.text,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 60,
        // width: MediaQuery.of(context).size.width * 0.29,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  images,
                  scale: 17,
                  // height: 30,
                  // width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
