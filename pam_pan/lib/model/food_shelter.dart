const String tableFoodShelter = "FoodShelter";

class FoodShelterFields {
  static final List<String> values = [id, shelterLong, shelterLat, shelterName];

  static const String id = "_id";
  static const String shelterLong = "Shelter_Long";
  static const String shelterLat = "Shelter_Lat";
  static const String shelterName = "Shelter_Name";
}

class FoodShelter {
  final int? id;
  final double shelterLong;
  final double shelterLat;
  final String shelterName;

  const FoodShelter(
      {this.id,
      required this.shelterLong,
      required this.shelterLat,
      required this.shelterName});

  FoodShelter copy(
          {int? id,
          double? shelterLong,
          double? shelterLat,
          String? shelterName}) =>
      FoodShelter(
          id: id ?? this.id,
          shelterLong: shelterLong ?? this.shelterLong,
          shelterLat: shelterLat ?? this.shelterLat,
          shelterName: shelterName ?? this.shelterName);

  static FoodShelter fromJson(Map<String, Object?> json) => FoodShelter(
      id: json[FoodShelterFields.id] as int?,
      shelterLong: json[FoodShelterFields.shelterLong] as double,
      shelterLat: json[FoodShelterFields.shelterLat] as double,
      shelterName: json[FoodShelterFields.shelterName] as String);

  Map<String, Object?> toJson() => {
        FoodShelterFields.id: id,
        FoodShelterFields.shelterLong: shelterLong,
        FoodShelterFields.shelterLat: shelterLat,
        FoodShelterFields.shelterName: shelterName
      };
}
