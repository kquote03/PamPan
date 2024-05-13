import "package:pam_pan/accountsetup/libdb.dart";

class DBInterface {
  final DBConnection = LibDB();

  void insertFoodItem(itemName, exiryDate, category, allergen, unit, quantity) {
    LibDB().execSQL(
        'INSERT INTO FoodItem VALUES $itemName, $exiryDate, "", 0, $unit, $quantity, $category;');
  }
}
