const String tablePersonAllergens = "Person_Allergens";

class PersonAllergensFields {
  static final List<String> values = [id, username, allergen];

  static const String id = "_id";
  static const String username = 'Username';
  static const String allergen = "Allergen";
}

class PersonAllergens {
  final int? id;
  final String username;
  final String allergen;

  const PersonAllergens({
    this.id,
    required this.username,
    required this.allergen,
  });

  PersonAllergens copy({int? id, String? username, String? allergen}) =>
      PersonAllergens(
        id: id ?? this.id,
        username: username ?? this.username,
        allergen: allergen ?? this.allergen,
      );

  static PersonAllergens fromJson(Map<String, Object?> json) => PersonAllergens(
      id: json[PersonAllergensFields.id] as int?,
      username: json[PersonAllergensFields.username] as String,
      allergen: json[PersonAllergensFields.allergen] as String);

  Map<String, Object?> toJson() => {
        PersonAllergensFields.id: id,
        PersonAllergensFields.username: username,
        PersonAllergensFields.allergen: allergen,
      };
}
