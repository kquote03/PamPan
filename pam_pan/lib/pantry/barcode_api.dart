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

    return FoodItem(
        itemName: productData['product_name_en'] as String,
        barcode: productData['code'] as String,
        measurementUnit: ['l', 'g', 'ml', 'kg', 'pieces']
                .contains(productData['serving_quantity_unit'].toLowerCase())
            ? productData['serving_quantity_unit'].toLowerCase()
            : '',
        categoryName: productData['categories_tags'][0]
                .toString()
                .replaceAll("en:", "") ??
            "");
  }
}
