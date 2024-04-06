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

    _database = await _initDB('person.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const usernameType = 'TEXT PRIMARY KEY NOT NULL';
    const personLongType =
        'REAL NOT NULL CHECK (${PersonFields.personLong} >= -9999999.99999 AND ${PersonFields.personLong} <= 9999999.99999)';
    const personLatType =
        'REAL NOT NULL CHECK (${PersonFields.personLat} >= -9999999.99999 AND ${PersonFields.personLat} <= 9999999.99999)';
    const emailType = "NOT NULL UNIQUE CHECK (Email LIKE '%@%.%')";

    await db.execute('''create table $tablePerson ( 
        ${PersonFields.id} $idType,
        ${PersonFields.username} $usernameType,
        ${PersonFields.personLong} $personLongType,
        ${PersonFields.personLat} $personLatType,
        ${PersonFields.email} $emailType,)
        ''');
  }

  Future<Person> create(Person person) async {
    final db = await instance.database;

    final id = await db.insert(tablePerson, person.toJson());
    return person.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
