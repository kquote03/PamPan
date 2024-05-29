import 'package:flutter/material.dart';
import 'package:pam_pan/pantryNEW/colors.dart';

class ItemDescriptionCard extends StatelessWidget {
  final String image;
  final String name;
  final String expiryDate;
  final String measurementUnit;
  final String quantity;

  const ItemDescriptionCard(
      {super.key,
      required this.image,
      required this.name,
      required this.expiryDate,
      required this.measurementUnit,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                  fontSize: 16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  expiryDate,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: inActiveColor,
                                      fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "$quantity $measurementUnit",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: inActiveColor,
                                      fontSize: 16),
                                ),
                              ),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
