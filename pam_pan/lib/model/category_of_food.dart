const String tableCategoryOfFood = "CategoryOfFood";

class CategoryOfFoodFields {
  static const String id = "_id";
  static const String categoryName = "Category_Name";
  static const String username = 'Username';
}

class CategoryOfFood {
  final int? id;
  final String categoryName;
  final String username;

  const CategoryOfFood({
    this.id,
    required this.categoryName,
    required this.username,
  });

  CategoryOfFood copy({int? id, String? categoryName, String? username}) =>
      CategoryOfFood(
          id: id ?? this.id,
          categoryName: categoryName ?? this.categoryName,
          username: username ?? this.username);

  Map<String, Object?> toJson() => {
        CategoryOfFoodFields.id: id,
        CategoryOfFoodFields.categoryName: categoryName,
        CategoryOfFoodFields.username: username
      };
}
