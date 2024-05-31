import 'package:flutter/material.dart';

class FoodItem {
  String? itemId;
  String? itemName;
  String? expiryDate;
  String? barcode;
  String? productionDate;
  bool? canRefrigerate;
  String? measurementUnit;
  int? quantity;
  String? categoryName;

  FoodItem({
    this.itemId,
    this.itemName,
    this.expiryDate,
    this.barcode,
    this.productionDate,
    this.canRefrigerate,
    this.measurementUnit,
    this.quantity,
    this.categoryName,
  });

  FoodItem.fromGeminiJson(Map json) {
    itemName = json['itemName'];
    expiryDate = json['expiryDate'];
    categoryName = json['category'];
    measurementUnit = json['measurementUnit'];
  }

  // You can add methods here to perform operations on the FoodItem

  @override
  String toString() {
    return '$itemName';
  }
}

class FoodItemRow extends StatelessWidget {
  final FoodItem foodItem;
  // final String image;

  const FoodItemRow({
    required this.foodItem,
    // required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Container(
          //   height: 120,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(18),
          //   ),
          //   child: Image.asset(
          //     image,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(
                    foodItem.itemName ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, //mainColor
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Expiry Date: ${foodItem.expiryDate}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey, //inActiveColor
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Quantity: ${foodItem.quantity.toString()} ${foodItem.measurementUnit}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 16),
                      ),
                    ),
                    const Icon(Icons.more_vert)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
