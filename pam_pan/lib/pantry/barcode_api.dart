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
    // Extract the required data from the JSON

    Map<String, dynamic> tempMap = {};
    final productData = jsonData['product'];
    // Extract the required data from the JSON
    try {
      tempMap['itemName'] = productData['product_name'] as String;
    } catch (e) {
      tempMap['itemName'] = "";
    }
    try {
      tempMap['barcode'] = productData['code'] as String;
    } catch (e) {
      tempMap['barcode'] = "";
    }
    // Sometimes OpenFoodFacts will have a weird serving unit.
    // I'm trying to control the chaos.
    try {
      tempMap['measurementUnit'] = ['l', 'g', 'ml', 'kg', 'pieces']
              .contains(productData['serving_quantity_unit'].toLowerCase())
          ? productData['serving_quantity_unit'].toLowerCase()
          : '';
    } catch (e) {
      tempMap['measurementUnit'] = "";
    }

    try {
      tempMap['categoryName'] =
          productData['categories_tags'][0].toString().replaceAll("en:", "");
    } catch (e) {
      tempMap['categoryName'] = "";
    }

    return FoodItem(
        itemName: tempMap['itemName'],
        barcode: tempMap['barcode'],
        measurementUnit: tempMap['measurementUnit'],
        categoryName: tempMap['categoryName']);
  }
}
