const String tableFoodItem2 = "FoodItem_ItemName_ExpiryDate";

class FoodItem2Fields {
  static const String id = "_id";
  static const String itemName = "Item_Name";
  static const String expiryDate = "Expiry_Date";
  static const String measurementUnit = "Measurement_Unit";
  static const String refrigeration = "Refrigeration";
  static const String productionDate = "Production_Date";
  static const String barcode = "Barcode";
  static const String quantity = "Quantity";
}

class FoodItem2 {
  final int? id;
  final String itemName;
  final DateTime expiryDate;
  final String measurementUnit;
  final bool refrigeration;
  final DateTime productionDate;
  final String barcode;
  final double quantity;

  const FoodItem2(
      {this.id,
      required this.itemName,
      required this.expiryDate,
      required this.measurementUnit,
      required this.refrigeration,
      required this.productionDate,
      required this.barcode,
      required this.quantity});

  FoodItem2 copy({
    int? id,
    String? itemName,
    DateTime? expiryDate,
    String? measurementUnit,
    bool? refrigeration,
    DateTime? productionDate,
    String? barcode,
    double? quantity,
  }) =>
      FoodItem2(
          id: id ?? this.id,
          itemName: itemName ?? this.itemName,
          expiryDate: expiryDate ?? this.expiryDate,
          measurementUnit: measurementUnit ?? this.measurementUnit,
          refrigeration: refrigeration ?? this.refrigeration,
          productionDate: productionDate ?? this.productionDate,
          barcode: barcode ?? this.barcode,
          quantity: quantity ?? this.quantity);

  Map<String, Object?> toJson() => {
        FoodItem2Fields.id: id,
        FoodItem2Fields.itemName: itemName,
        FoodItem2Fields.expiryDate: expiryDate.toIso8601String(),
        FoodItem2Fields.measurementUnit: measurementUnit,
        FoodItem2Fields.refrigeration: refrigeration ? 1 : 0,
        FoodItem2Fields.productionDate: productionDate.toIso8601String(),
        FoodItem2Fields.barcode: barcode,
        FoodItem2Fields.quantity: quantity
      };
}
