class FoodItem {
  int? itemId;
  final String itemName;
  final String expiryDate;
  final String? barcode;
  final String productionDate;
  final bool canRefrigerate;
  final String measurementUnit;
  final int quantity;
  final String categoryName;

  FoodItem({
    this.itemId,
    required this.itemName,
    required this.expiryDate,
    this.barcode,
    required this.productionDate,
    required this.canRefrigerate,
    required this.measurementUnit,
    required this.quantity,
    required this.categoryName,
  });

  // You can add methods here to perform operations on the FoodItem

  @override
  String toString() {
    return 'FoodItem(itemId: $itemId, itemName: $itemName, expiryDate: $expiryDate, barcode: $barcode, productionDate: $productionDate, canRefrigerate: $canRefrigerate, measurementUnit: $measurementUnit, quantity: $quantity, categoryName: $categoryName)';
  }
}
