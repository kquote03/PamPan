const String tablePerson = 'Person';

class PersonFields {
  static final List<String> values = [
    id,
    username,
    personLong,
    personLat,
    email
  ];

  static const String id = '_id';
  static const String username = 'Username';
  static const String personLong = 'Person_Long';
  static const String personLat = 'Person_Lat';
  static const String email = 'Email';
}

class Person {
  final int? id;
  final String username;
  final double personLong;
  final double personLat;
  final String email;

  const Person(
      {this.id,
      required this.username,
      required this.personLong,
      required this.personLat,
      required this.email});

  Person copy({
    int? id,
    String? username,
    double? personLong,
    double? personLat,
    String? email,
  }) =>
      Person(
          id: id ?? this.id,
          username: username ?? this.username,
          personLong: personLong ?? this.personLong,
          personLat: personLat ?? this.personLat,
          email: email ?? this.email);

  static Person fromJson(Map<String, Object?> json) => Person(
        id: json[PersonFields.id] as int?,
        username: json[PersonFields.username] as String,
        personLong: json[PersonFields.personLong] as double,
        personLat: json[PersonFields.personLat] as double,
        email: json[PersonFields.email] as String,
      );

  Map<String, Object?> toJson() => {
        PersonFields.id: id,
        PersonFields.username: username,
        PersonFields.personLong: personLong,
        PersonFields.personLat: personLat,
        PersonFields.email: email
      };
}
