const String tablePerson = 'Person';

class PersonFields {
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

  Map<String, Object?> toJson() => {
        PersonFields.id: id,
      };
// finish map
//finish copy method
}
