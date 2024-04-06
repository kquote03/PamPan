const String tablePartOf = "PartOf";

class PartOfFields {
  static const String id = "_id";
  static const String itemName = "Item_Name";
  static const String expiryDate = "Expiry_Date";
  static const String username = 'Username';
  static const String shelterLong = "Shelter_Long";
  static const String shelterLat = "Shelter_Lat";
  static const String categoryName = "Category_Name";
}

class PartOf {
  final int? id;
  final String itemName;
  final DateTime expiryDate;
  final String username;
  final double shelterLong;
  final double shelterLat;
  final String categoryName;

  const PartOf(
      {this.id,
      required this.itemName,
      required this.expiryDate,
      required this.username,
      required this.shelterLong,
      required this.shelterLat,
      required this.categoryName});

  PartOf copy(
          {int? id,
          String? itemName,
          DateTime? expiryDate,
          String? username,
          double? shelterLong,
          double? shelterLat,
          String? categoryName}) =>
      PartOf(
          id: id ?? this.id,
          itemName: itemName ?? this.itemName,
          expiryDate: expiryDate ?? this.expiryDate,
          username: username ?? this.username,
          shelterLong: shelterLong ?? this.shelterLong,
          shelterLat: shelterLat ?? this.shelterLat,
          categoryName: categoryName ?? this.categoryName);

  Map<String, Object?> toJson() => {
        PartOfFields.id: id,
        PartOfFields.itemName: itemName,
        PartOfFields.expiryDate: expiryDate.toIso8601String(),
        PartOfFields.username: username,
        PartOfFields.shelterLong: shelterLong,
        PartOfFields.shelterLat: shelterLat,
        PartOfFields.categoryName: categoryName,
      };
}
