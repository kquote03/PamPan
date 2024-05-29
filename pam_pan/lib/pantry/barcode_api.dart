import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pam_pan/pantry/food_item.dart';

class BarcodeApi {
  Future<FoodItem> getFoodItemByUPC(String upc) async {
    print(upc);
    final httpPackageUrl =
        Uri.parse("https://world.openfoodfacts.org/api/v0/product/$upc.json");
    final httpPackageInfo = await http.read(httpPackageUrl);
    final httpPackageJson =
        json.decode(httpPackageInfo) as Map<String, dynamic>;
    return mapJsonToFoodItem(httpPackageJson);
  }

  FoodItem mapJsonToFoodItem(Map<String, dynamic> jsonData) {
    final productData = jsonData['product'];

    // Extract the required data from the JSON
    final itemName = productData['product_name_en'] as String;
    final expiryDate =
        ''; // JSON doesn't contain expiry date, set to empty string
    final barcode = productData['code'] as String;
    final productionDate =
        ''; // JSON doesn't contain production date, set to empty string
    final canRefrigerate =
        false; // JSON doesn't contain information about refrigeration, set to false
    final measurementUnit = productData['quantity'].toString().split(' ').last;
    final quantity = productData['quantity'].toString().split(' ').first;
    final categoryName =
        ''; // JSON doesn't contain category name, set to empty string

    return FoodItem(
      itemName: itemName,
      expiryDate: expiryDate,
      barcode: barcode,
      productionDate: productionDate,
      canRefrigerate: canRefrigerate,
      measurementUnit: measurementUnit,
      quantity: quantity,
      categoryName: categoryName,
    );
  }
}
