import 'package:flutter/material.dart';

class FoodItem {
  int? itemId;
  final String itemName;
  final String expiryDate;
  final String? barcode;
  final String? productionDate;
  final bool? canRefrigerate;
  final String measurementUnit;
  final String quantity;
  final String categoryName;

  FoodItem({
    this.itemId,
    required this.itemName,
    required this.expiryDate,
    this.barcode,
    this.productionDate,
    this.canRefrigerate,
    required this.measurementUnit,
    required this.quantity,
    required this.categoryName,
  });

  // You can add methods here to perform operations on the FoodItem

  @override
  String toString() {
    return 'FoodItem(itemId: $itemId, itemName: $itemName, expiryDate: $expiryDate, measurementUnit: $measurementUnit, quantity: $quantity, categoryName: $categoryName)';
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
                    foodItem.itemName,
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
                        "Quantity: ${foodItem.quantity} ${foodItem.measurementUnit}",
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
