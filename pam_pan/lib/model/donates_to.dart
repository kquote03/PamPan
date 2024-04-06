const String tableDonatesTo = "DonatesTo";

class DonatesToFields {
  static const String id = "_id";
  static const String username = 'Username';
  static const String shelterLong = "Shelter_Long";
  static const String shelterLat = "Shelter_Lat";
}

class DonatesTo {
  final int? id;
  final String username;
  final double shelterLong;
  final double shelterLat;

  const DonatesTo(
      {this.id,
      required this.username,
      required this.shelterLong,
      required this.shelterLat});

  DonatesTo copy(
          {int? id,
          String? username,
          double? shelterLong,
          double? shelterLat}) =>
      DonatesTo(
          id: id ?? this.id,
          username: username ?? this.username,
          shelterLong: shelterLong ?? this.shelterLong,
          shelterLat: shelterLat ?? this.shelterLat);

  Map<String, Object?> toJson() => {
        DonatesToFields.id: id,
        DonatesToFields.username: username,
        DonatesToFields.shelterLong: shelterLong,
        DonatesToFields.shelterLat: shelterLat
      };
}
