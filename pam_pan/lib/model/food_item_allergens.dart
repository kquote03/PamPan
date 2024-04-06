const String tableFoodItemAllergens = "FoodItem_Allergens";

class FoodItemAllergensFields {
  static final List<String> values = [
    id,
    itemName,
    expiryDate,
    username,
    shelterLong,
    shelterLat,
    allergen
  ];

  static const String id = "_id";
  static const String itemName = "Item_Name";
  static const String expiryDate = "Expiry_Date";
  static const String username = 'Username';
  static const String shelterLong = "Shelter_Long";
  static const String shelterLat = "Shelter_Lat";
  static const String allergen = "Allergen";
}

class FoodItemAllergens {
  final int? id;
  final String itemName;
  final DateTime expiryDate;
  final String username;
  final double shelterLong;
  final double shelterLat;
  final String allergen;

  const FoodItemAllergens(
      {this.id,
      required this.itemName,
      required this.expiryDate,
      required this.username,
      required this.shelterLong,
      required this.shelterLat,
      required this.allergen});

  FoodItemAllergens copy(
          {int? id,
          String? itemName,
          DateTime? expiryDate,
          String? username,
          double? shelterLong,
          double? shelterLat,
          String? allergen}) =>
      FoodItemAllergens(
          id: id ?? this.id,
          itemName: itemName ?? this.itemName,
          expiryDate: expiryDate ?? this.expiryDate,
          username: username ?? this.username,
          shelterLong: shelterLong ?? this.shelterLong,
          shelterLat: shelterLat ?? this.shelterLat,
          allergen: allergen ?? this.allergen);

  static FoodItemAllergens fromJson(
          Map<String, Object?> json) =>
      FoodItemAllergens(
          id: json[FoodItemAllergensFields.id] as int?,
          itemName: json[FoodItemAllergensFields.itemName] as String,
          expiryDate:
              DateTime.parse([FoodItemAllergensFields.expiryDate] as String),
          username: json[FoodItemAllergensFields.username] as String,
          shelterLong: json[FoodItemAllergensFields.shelterLong] as double,
          shelterLat: json[FoodItemAllergensFields.shelterLat] as double,
          allergen: json[FoodItemAllergensFields.allergen] as String);

  Map<String, Object?> toJson() => {
        FoodItemAllergensFields.id: id,
        FoodItemAllergensFields.itemName: itemName,
        FoodItemAllergensFields.expiryDate: expiryDate.toIso8601String(),
        FoodItemAllergensFields.username: username,
        FoodItemAllergensFields.shelterLong: shelterLong,
        FoodItemAllergensFields.shelterLat: shelterLat,
        FoodItemAllergensFields.allergen: allergen
      };
}
