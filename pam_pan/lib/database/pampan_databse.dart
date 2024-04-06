import 'package:pam_pan/model/person.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PamPanDatabase {
  static final PamPanDatabase instance = PamPanDatabase._init();

  static Database? _database;

  PamPanDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('PamPan.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Person (
      Username TEXT NOT NULL,
      Person_Long DECIMAL(10, 7) NOT NULL,
      Person_Lat DECIMAL(10, 7) NOT NULL,
      Email TEXT NOT NULL UNIQUE,
      CONSTRAINT Email_Check CHECK (Email LIKE '%@%.%'),
      PRIMARY KEY (Username) CONSTRAINT Person_PK
    ); 
        ''');

    await db.execute('''
    CREATE TABLE Person_Email (
      Email TEXT NOT NULL UNIQUE,
      CONSTRAINT Email_Check CHECK (Email LIKE '%@%.%'),
      Password_Person TEXT NOT NULL,
      CONSTRAINT Password_Check CHECK (
        LENGTH(Password_Person) >= 6
        AND Password_Person GLOB '*[A-Z]*'
        AND Password_Person GLOB '*[a-z]*'
        AND Password_Person GLOB '*[0-9]*'
        AND Password_Person GLOB '*[!@#\$%^&*(),.?":{}|<>]*'
      ),
      Mobile TEXT UNIQUE,
      CONSTRAINT Mobile_Check CHECK (Mobile LIKE '+(%__) - ___ - ____'),
      FName TEXT NOT NULL,
      LName TEXT NOT NULL,
      Points INTEGER NOT NULL,
      CONSTRAINT Points_Check CHECK (Points > 0),
      FOREIGN KEY (Email) REFERENCES Person(Email) ON DELETE CASCADE CONSTRAINT Email_FK,
      PRIMARY KEY (Email) CONSTRAINT PersonEmail_PK
    );
        ''');
  }

  Future<Person> create(Person person) async {
    final db = await instance.database;

    final id = await db.insert(tablePerson, person.toJson());
    return person.copy(id: id);
  }

  Future<Person> readPerson(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePerson,
      columns: PersonFields.values,
      where: '${PersonFields.username} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Person.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<Person>> readAllPerson() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tablePerson); //you'd have to include the orderBy field here if you do that
    return result.map((json) => Person.fromJson(json)).toList();
  }

  Future<int> update(Person person) async {
    final db = await instance.database;

    return db.update(
      tablePerson,
      person.toJson(),
      where: '${PersonFields.id} = ?',
      whereArgs: [person.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePerson,
      where: '${PersonFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
