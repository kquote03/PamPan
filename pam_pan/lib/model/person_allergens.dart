const String tablePersonAllergens = "Person_Allergens";

class PersonAllergensFields {
  static const String id = "_id";
  static const String allergen = "Allergen";
}

class PersonAllergens {
  final int? id;
  final String allergen;

  const PersonAllergens({
    this.id,
    required this.allergen,
  });

  PersonAllergens copy({int? id, String? allergen}) => PersonAllergens(
        id: id ?? this.id,
        allergen: allergen ?? this.allergen,
      );

  Map<String, Object?> toJson() => {
        PersonAllergensFields.id: id,
        PersonAllergensFields.allergen: allergen,
      };
}
