import 'package:flutter/material.dart';
// import 'package:pam_pan/pantryNEW/colors.dart';

class ItemDescriptionCard extends StatelessWidget {
  final String image;
  final String name;
  final String expiryDate;
  final String measurementUnit;
  final String quantity;

  const ItemDescriptionCard({
    super.key,
    required this.image,
    required this.name,
    required this.expiryDate,
    required this.measurementUnit,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 0),
      child: Stack(
        children: [
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
              child: Row(
                children: [
                  Container(
                      height: 100,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Image.asset(
                        image!,
                        scale: 17,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/categories/other.png',
                            scale: 17,
                          );
                        },
                      )),
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
                                color: Colors.black, //mainColor
                                fontSize: 16,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Expiry Date: $expiryDate",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey, //inActiveColor
                                fontSize: 16,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Quantity: $quantity $measurementUnit",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
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
