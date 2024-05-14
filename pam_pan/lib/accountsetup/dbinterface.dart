import "package:pam_pan/accountsetup/libdb.dart";

class DBInterface {
  final db = LibDB().initializeDB();

  void insertFoodItem(itemName, exiryDate, category, allergen, unit, quantity) {
    db.then((connection) {
      connection.execute(
          'INSERT INTO FoodItem (Item_Name, Expiry_Date, Barcode, ProductionDate, Can_Refrigerate, Measurement_Unit, Quantity, Category_Name) VALUES ("$itemName", "$exiryDate", "", "", 0, "$unit", $quantity, "$category")');
    });
  }

  getFoodItem() async {
    var val = db.then((connection) async {
      //print(await connection.rawQuery('SELECT * FROM FoodItem'));
      return await connection.rawQuery('SELECT * FROM FoodItem');
    });
    return await val;
  }
}
