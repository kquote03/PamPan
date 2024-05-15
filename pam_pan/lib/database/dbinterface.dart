import "package:pam_pan/database/libdb.dart";

class DBInterface {
  final db = LibDB().initializeDB();

  void insertFoodItem(itemName, exiryDate, category, allergen, unit, quantity) {
    db.then((connection) {
      connection.execute(
          'INSERT INTO FoodItem (Item_Name, Expiry_Date, Barcode, ProductionDate, Can_Refrigerate, Measurement_Unit, Quantity, Category_Name) VALUES ("$itemName", "$exiryDate", "", "", 0, "$unit", $quantity, "$category")');
    });
  }

  getFoodItemById(int item_id) async {
    var val = db.then((connection) async {
      return await connection
          .rawQuery('SELECT * FROM FoodItem WHERE Item_Id = $item_id');
    });
    return await val;
  }

  Future<List> getFoodItemList() async {
    var val = db.then((connection) async {
      return await connection.rawQuery('SELECT * FROM FoodItem');
    });
    return await val;
  }
}
