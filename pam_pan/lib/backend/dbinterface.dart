import "package:pam_pan/pantry/food_item.dart";
import "package:pam_pan/backend/libdb.dart";

class DBInterface {
  final db = LibDB().initializeDB();

  void insertFoodItem(
      itemName, expiryDate, category, allergen, unit, quantity) {
    db.then((connection) {
      connection.execute(
          'INSERT INTO FoodItem (Item_Name, Expiry_Date, Barcode, ProductionDate, Can_Refrigerate, Measurement_Unit, Quantity, Category_Name) VALUES ("$itemName", "$expiryDate", "", "", 0, "$unit", $quantity, "$category")');
    });
  }

  Future<FoodItem?> getFoodItemById(int itemId) async {
    final result = await db.then((connection) async {
      return await connection
          .rawQuery('SELECT * FROM FoodItem WHERE Item_Id = $itemId');
    });

    if (result.isNotEmpty) {
      final row = result.first;
      return FoodItem(
        itemId: row['Item_Id'] as int?,
        itemName: row['Item_Name'] as String,
        expiryDate: row['Expiry_Date'] as String,
        barcode: row['Barcode'] as String?,
        productionDate: row['ProductionDate'] as String,
        canRefrigerate: row['Can_Refrigerate'] == 1,
        measurementUnit: row['Measurement_Unit'] as String,
        quantity: row['Quantity'] as String,
        categoryName: row['Category_Name'] as String,
      );
    }

    return null;
  }

  Future<List<FoodItem>> getFoodItemList() async {
    final result = await db.then((connection) async {
      return await connection.rawQuery('SELECT * FROM FoodItem');
    });

    return result.map((row) {
      return FoodItem(
        itemId: row['Item_Id'] as int?,
        itemName: row['Item_Name'] as String,
        expiryDate: row['Expiry_Date'] as String,
        barcode: row['Barcode'] as String?,
        productionDate: row['ProductionDate'] as String,
        canRefrigerate: row['Can_Refrigerate'] == 1,
        measurementUnit: row['Measurement_Unit'] as String,
        quantity: row['Quantity'] as String,
        categoryName: row['Category_Name'] as String,
      );
    }).toList();
  }
}
