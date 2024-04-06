const String tableFoodItem2 = "FoodItem_ItemName_ExpiryDate";

class FoodItem2Fields {
  static final List<String> values = [
    id,
    itemName,
    expiryDate,
    measurementUnit,
    refrigeration,
    productionDate,
    barcode,
    quantity
  ];

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

  static FoodItem2 fromJson(Map<String, Object?> json) => FoodItem2(
      id: json[FoodItem2Fields.id] as int?,
      itemName: json[FoodItem2Fields.itemName] as String,
      expiryDate: DateTime.parse(json[FoodItem2Fields.expiryDate] as String),
      measurementUnit: json[FoodItem2Fields.measurementUnit] as String,
      refrigeration: json[FoodItem2Fields.refrigeration] == 1,
      productionDate:
          DateTime.parse(json[FoodItem2Fields.productionDate] as String),
      barcode: json[FoodItem2Fields.barcode] as String,
      quantity: json[FoodItem2Fields.quantity] as double);

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
