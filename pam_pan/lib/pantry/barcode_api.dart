import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pam_pan/pantry/food_item.dart';

class BarcodeApi {
  Future<Map<String, dynamic>> getFoodItemByUPC(String upc) async {
    print(upc);
    final httpPackageUrl =
        Uri.parse("https://world.openfoodfacts.org/api/v0/product/$upc.json");
    final httpPackageInfo = await http.read(httpPackageUrl);
    final httpPackageJson =
        json.decode(httpPackageInfo) as Map<String, dynamic>;
    return mapJsonToFoodItem(httpPackageJson);
  }

  Map<String, dynamic> mapJsonToFoodItem(Map<String, dynamic> jsonData) {
    Map<String, dynamic> tempMap = {};
    final productData = jsonData['product'];

    // Extract the required data from the JSON
    tempMap['itemName'] = productData['product_name_en'] as String;
    tempMap['barcode'] = productData['code'] as String;

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
    return tempMap;
  }
}
