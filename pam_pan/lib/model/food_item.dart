const String tableFoodItem = 'FoodItem';

class FoodItemFields {
  static const String id = "_id";
  static const String itemName = "Item_Name";
  static const String expiryDate = "Expiry_Date";
  static const String username = "Username";
  static const String shelterLong = "Shelter_Long";
  static const String shelterLat = "Shelter_Lat";
}

class FoodItem {
  final int? id;
  final String itemName;
  final DateTime expiryDate;
  final String username;
  final double shelterLong;
  final double shelterLat;

  const FoodItem(
      {this.id,
      required this.itemName,
      required this.expiryDate,
      required this.username,
      required this.shelterLong,
      required this.shelterLat});

  FoodItem copy({
    int? id,
    String? itemName,
    DateTime? expiryDate,
    String? username,
    double? shelterLong,
    double? shelterLat,
  }) =>
      FoodItem(
        id: id ?? this.id,
        itemName: itemName ?? this.itemName,
        expiryDate: expiryDate ?? this.expiryDate,
        username: username ?? this.username,
        shelterLong: shelterLong ?? this.shelterLong,
        shelterLat: shelterLat ?? this.shelterLat,
      );

  Map<String, Object?> toJson() => {
        FoodItemFields.id: id,
        FoodItemFields.itemName: itemName,
        FoodItemFields.expiryDate: expiryDate.toIso8601String(),
        FoodItemFields.username: username,
        FoodItemFields.shelterLong: shelterLong,
        FoodItemFields.shelterLat: shelterLat
      };
}
