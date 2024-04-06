const String tableCategoryOfFood = "CategoryOfFood";

class CategoryOfFoodFields {
  static final List<String> values = [id, categoryName, username];

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

  static CategoryOfFood fromJson(Map<String, Object?> json) => CategoryOfFood(
      id: json[CategoryOfFoodFields.id] as int?,
      categoryName: json[CategoryOfFoodFields.categoryName] as String,
      username: json[CategoryOfFoodFields.username] as String);

  Map<String, Object?> toJson() => {
        CategoryOfFoodFields.id: id,
        CategoryOfFoodFields.categoryName: categoryName,
        CategoryOfFoodFields.username: username
      };
}
