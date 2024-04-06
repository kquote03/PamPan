const String tablePersonEmail = 'Person_Email';

class PersonEmailFields {
  static final List<String> values = [
    id,
    email,
    passwordPerson,
    mobile,
    fName,
    lName,
    points
  ];

  static const String id = "_id";
  static const String email = "Email";
  static const String passwordPerson = "Password_Person";
  static const String mobile = "Mobile";
  static const String fName = "FName";
  static const String lName = "LName";
  static const String points = "Points";
}

class PersonEmail {
  final int? id;
  final String email;
  final String passwordPerson;
  final String mobile;
  final String fName;
  final String lName;
  final int points;

  const PersonEmail(
      {this.id,
      required this.email,
      required this.passwordPerson,
      required this.mobile,
      required this.fName,
      required this.lName,
      required this.points});

  PersonEmail copy(
          {int? id,
          String? email,
          String? passwordPerson,
          String? mobile,
          String? fName,
          String? lName,
          int? points}) =>
      PersonEmail(
          id: id ?? this.id,
          email: email ?? this.email,
          passwordPerson: passwordPerson ?? this.passwordPerson,
          mobile: mobile ?? this.mobile,
          fName: fName ?? this.fName,
          lName: lName ?? this.lName,
          points: points ?? this.points);

  static PersonEmail fromJson(Map<String, Object?> json) => PersonEmail(
      id: json[PersonEmailFields.id] as int?,
      email: json[PersonEmailFields.email] as String,
      passwordPerson: json[PersonEmailFields.passwordPerson] as String,
      mobile: json[PersonEmailFields.mobile] as String,
      fName: json[PersonEmailFields.fName] as String,
      lName: json[PersonEmailFields.lName] as String,
      points: json[PersonEmailFields.points] as int);

  Map<String, Object?> toJson() => {
        PersonEmailFields.id: id,
        PersonEmailFields.email: email,
        PersonEmailFields.passwordPerson: passwordPerson,
        PersonEmailFields.mobile: mobile,
        PersonEmailFields.fName: fName,
        PersonEmailFields.lName: lName,
        PersonEmailFields.points: points,
      };
}
