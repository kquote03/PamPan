import 'package:pam_pan/model/category_of_food.dart';
import 'package:pam_pan/model/donates_to.dart';
import 'package:pam_pan/model/food_item.dart';
import 'package:pam_pan/model/food_item2.dart';
import 'package:pam_pan/model/food_item_allergens.dart';
import 'package:pam_pan/model/food_shelter.dart';
import 'package:pam_pan/model/part_of.dart';
import 'package:pam_pan/model/person.dart';
import 'package:pam_pan/model/person_allergens.dart';
import 'package:pam_pan/model/person_email.dart';
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

  Future<Person> createPerson(Person person) async {
    final db = await instance.database;

    final id = await db.insert(tablePerson, person.toJson());
    return person.copy(id: id);
  }

  Future<Person> readPerson(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePerson,
      columns: PersonFields.values,
      where: '${PersonFields.id} = ?',
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

  Future<int> updatePerson(Person person) async {
    final db = await instance.database;

    return db.update(
      tablePerson,
      person.toJson(),
      where: '${PersonFields.id} = ?',
      whereArgs: [person.id],
    );
  }

  Future<int> deletePerson(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePerson,
      where: '${PersonFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<PersonEmail> createPersonEmail(PersonEmail personEmail) async {
    final db = await instance.database;

    final id = await db.insert(tablePersonEmail, personEmail.toJson());
    return personEmail.copy(id: id);
  }

  Future<PersonEmail> readPersonEmail(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePersonEmail,
      columns: PersonEmailFields.values,
      where: '${PersonEmailFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return PersonEmail.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<PersonEmail>> readAllPersonEmail() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tablePersonEmail); //you'd have to include the orderBy field here if you do that
    return result.map((json) => PersonEmail.fromJson(json)).toList();
  }

  Future<int> updatePersonEmail(PersonEmail personEmail) async {
    final db = await instance.database;

    return db.update(
      tablePersonEmail,
      personEmail.toJson(),
      where: '${PersonEmailFields.id} = ?',
      whereArgs: [personEmail.id],
    );
  }

  Future<int> deletePersonEmail(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePersonEmail,
      where: '${PersonEmailFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<PersonAllergens> createPersonAllergens(
      PersonAllergens personAllergens) async {
    final db = await instance.database;

    final id = await db.insert(tablePersonAllergens, personAllergens.toJson());
    return personAllergens.copy(id: id);
  }

  Future<PersonAllergens> readPersonAllergens(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePersonAllergens,
      columns: PersonAllergensFields.values,
      where: '${PersonAllergensFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return PersonAllergens.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<PersonAllergens>> readAllPersonAllergens() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tablePersonAllergens); //you'd have to include the orderBy field here if you do that
    return result.map((json) => PersonAllergens.fromJson(json)).toList();
  }

  Future<int> updatePersonAllergens(PersonAllergens personAllergens) async {
    final db = await instance.database;

    return db.update(
      tablePersonAllergens,
      personAllergens.toJson(),
      where: '${PersonAllergensFields.id} = ?',
      whereArgs: [personAllergens.id],
    );
  }

  Future<int> deletePersonAllergens(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePersonAllergens,
      where: '${PersonAllergensFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<CategoryOfFood> createCategoryOfFood(
      CategoryOfFood categoryOfFood) async {
    final db = await instance.database;

    final id = await db.insert(tableCategoryOfFood, categoryOfFood.toJson());
    return categoryOfFood.copy(id: id);
  }

  Future<CategoryOfFood> readCategoryOfFood(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCategoryOfFood,
      columns: CategoryOfFoodFields.values,
      where: '${CategoryOfFoodFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return CategoryOfFood.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<CategoryOfFood>> readAllCategoryOfFood() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tableCategoryOfFood); //you'd have to include the orderBy field here if you do that
    return result.map((json) => CategoryOfFood.fromJson(json)).toList();
  }

  Future<int> updateCategoryOfFood(CategoryOfFood categoryOfFood) async {
    final db = await instance.database;

    return db.update(
      tableCategoryOfFood,
      categoryOfFood.toJson(),
      where: '${CategoryOfFoodFields.id} = ?',
      whereArgs: [categoryOfFood.id],
    );
  }

  Future<int> deleteCategoryOfFood(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableCategoryOfFood,
      where: '${CategoryOfFoodFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<FoodShelter> createFoodShelter(FoodShelter foodShelter) async {
    final db = await instance.database;

    final id = await db.insert(tableFoodShelter, foodShelter.toJson());
    return foodShelter.copy(id: id);
  }

  Future<FoodShelter> readFoodShelter(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableFoodShelter,
      columns: FoodShelterFields.values,
      where: '${FoodShelterFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return FoodShelter.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<FoodShelter>> readAllFoodShelter() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tableFoodShelter); //you'd have to include the orderBy field here if you do that
    return result.map((json) => FoodShelter.fromJson(json)).toList();
  }

  Future<int> updateFoodShelter(FoodShelter foodShelter) async {
    final db = await instance.database;

    return db.update(
      tableFoodShelter,
      foodShelter.toJson(),
      where: '${FoodShelterFields.id} = ?',
      whereArgs: [foodShelter.id],
    );
  }

  Future<int> deleteFoodShelter(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableFoodShelter,
      where: '${FoodShelterFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<FoodItem> createFoodItem(FoodItem foodItem) async {
    final db = await instance.database;

    final id = await db.insert(tableFoodItem, foodItem.toJson());
    return foodItem.copy(id: id);
  }

  Future<FoodItem> readFoodItem(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableFoodItem,
      columns: FoodItemFields.values,
      where: '${FoodItemFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return FoodItem.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<FoodItem>> readAllFoodItem() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tableFoodItem); //you'd have to include the orderBy field here if you do that
    return result.map((json) => FoodItem.fromJson(json)).toList();
  }

  Future<int> updateFoodItem(FoodItem foodItem) async {
    final db = await instance.database;

    return db.update(
      tableFoodItem,
      foodItem.toJson(),
      where: '${FoodItemFields.id} = ?',
      whereArgs: [foodItem.id],
    );
  }

  Future<int> deleteFoodItem(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableFoodItem,
      where: '${FoodItemFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<FoodItem2> createFoodItem2(FoodItem2 foodItem2) async {
    final db = await instance.database;

    final id = await db.insert(tableFoodItem2, foodItem2.toJson());
    return foodItem2.copy(id: id);
  }

  Future<FoodItem2> readFoodItem2(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableFoodItem2,
      columns: FoodItem2Fields.values,
      where: '${FoodItem2Fields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return FoodItem2.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<FoodItem2>> readAllFoodItem2() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tableFoodItem2); //you'd have to include the orderBy field here if you do that
    return result.map((json) => FoodItem2.fromJson(json)).toList();
  }

  Future<int> updateFoodItem2(FoodItem2 foodItem2) async {
    final db = await instance.database;

    return db.update(
      tableFoodItem2,
      foodItem2.toJson(),
      where: '${FoodItem2Fields.id} = ?',
      whereArgs: [foodItem2.id],
    );
  }

  Future<int> deleteFoodItem2(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableFoodItem2,
      where: '${FoodItem2Fields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<FoodItemAllergens> createFoodItemAllergens(
      FoodItemAllergens foodItemAllergens) async {
    final db = await instance.database;

    final id =
        await db.insert(tableFoodItemAllergens, foodItemAllergens.toJson());
    return foodItemAllergens.copy(id: id);
  }

  Future<FoodItemAllergens> readFoodItemAllergens(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableFoodItemAllergens,
      columns: FoodItemAllergensFields.values,
      where: '${FoodItemAllergensFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return FoodItemAllergens.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<FoodItemAllergens>> readAllFoodItemAllergens() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tableFoodItemAllergens); //you'd have to include the orderBy field here if you do that
    return result.map((json) => FoodItemAllergens.fromJson(json)).toList();
  }

  Future<int> updateFoodItemAllergens(
      FoodItemAllergens foodItemAllergens) async {
    final db = await instance.database;

    return db.update(
      tableFoodItemAllergens,
      foodItemAllergens.toJson(),
      where: '${FoodItemAllergensFields.id} = ?',
      whereArgs: [foodItemAllergens.id],
    );
  }

  Future<int> deleteFoodItemAllergens(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableFoodItemAllergens,
      where: '${FoodItemAllergensFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<PartOf> createPartOf(PartOf partOf) async {
    final db = await instance.database;

    final id = await db.insert(tablePartOf, partOf.toJson());
    return partOf.copy(id: id);
  }

  Future<PartOf> readPartOf(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePartOf,
      columns: PartOfFields.values,
      where: '${PartOfFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return PartOf.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<PartOf>> readAllPartOf() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tablePartOf); //you'd have to include the orderBy field here if you do that
    return result.map((json) => PartOf.fromJson(json)).toList();
  }

  Future<int> updatePartOf(PartOf partOf) async {
    final db = await instance.database;

    return db.update(
      tablePartOf,
      partOf.toJson(),
      where: '${PartOfFields.id} = ?',
      whereArgs: [partOf.id],
    );
  }

  Future<int> deletePartOf(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePartOf,
      where: '${PartOfFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<DonatesTo> createDonatesTo(DonatesTo donatesTo) async {
    final db = await instance.database;

    final id = await db.insert(tableDonatesTo, donatesTo.toJson());
    return donatesTo.copy(id: id);
  }

  Future<DonatesTo> readDonatesTo(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDonatesTo,
      columns: DonatesToFields.values,
      where: '${DonatesToFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return DonatesTo.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<DonatesTo>> readAllDonatesTo() async {
    final db = await instance.database;
    // final orderBy = '${PersonFields.}' order by a specific field, and then write ASC for ascending, all in the same string

    final result = await db.query(
        tableDonatesTo); //you'd have to include the orderBy field here if you do that
    return result.map((json) => DonatesTo.fromJson(json)).toList();
  }

  Future<int> updateDonatesTo(DonatesTo donatesTo) async {
    final db = await instance.database;

    return db.update(
      tableDonatesTo,
      donatesTo.toJson(),
      where: '${DonatesToFields.id} = ?',
      whereArgs: [donatesTo.id],
    );
  }

  Future<int> deleteDonatesTo(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableDonatesTo,
      where: '${DonatesToFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
