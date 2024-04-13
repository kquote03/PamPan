import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String INITIALIZATION_STATEMENT = """
CREATE TABLE Person.PamPanDB(
    Username TEXT NOT NULL CHECK(
        LENGTH(Username) >= 3
        AND LENGTH(Username) <= 10
    ),
    Email TEXT UNIQUE NOT NULL CHECK(
        GLOB '@.*'
        AND LENGTH(Email) <= 50
        AND LENGTH(SUBSTR(Email, 1, INSTR(Email, '@') - 1)) >= 3
        AND LENGTH(SUBSTR(Email, 1, INSTR(Email, '@') - 1)) <= 30
        AND LENGTH(SUBSTR(Email, INSTR(Email, '@') + 1, INSTR(Email, '.') - 1)) >= 3
    ),
    Passkey TEXT NOT NULL CHECK(
        LENGTH(Passkey) >= 8
        AND UPPER(Passkey) != Passkey
        AND LOWER(Passkey) != Passkey
        AND GLOB *’[0-9]’*
        AND GLOB *’[^a-zA-Z0-9]’*
    )
    Mobile TEXT CHECK(
        LENGTH(Mobile) = 12
        AND GLOB '05*'
        AND SUBSTR(Mobile, 3, 1) IN ('0', '2', '4', '5', '6', '8')
        AND SUBSTR(Mobile, 4, 1) = ' '
        AND SUBSTR(Mobile, 8, 1) = ' '
    ),
    FName TEXT NOT NULL CHECK(LENGTH(FName) >=3),
    LName TEXT NOT NULL CHECK(LENGTH(LName) >=3),
    Gender TEXT NOT NULL CHECK(Gender IN ('Male', 'Female', 'Other'))
    DOB TEXT NOT NULL CHECK(
        LENGTH(DOB) = 10
        AND GLOB '[0-9]/[0-9]/[0-9]'
        AND SUBSTR(DOB, 5, 1) = '/'
        AND SUBSTR(DOB, 8, 1) = '/',
        AND CAST(SUBSTR(DOB, 1, 4) AS INTEGER) <= CAST(STRFTIME('%Y', now) AS INTEGER) + 14
        AND CAST(SUBSTR(DOB, 6, 2) AS INTEGER) >= 1
        AND CAST(SUBSTR(DOB, 6, 2) AS INTEGER) <= 12
        AND CAST(SUBSTR(DOB, 9, 2) AS INTEGER) >= 1
        AND CAST(SUBSTR(DOB, 9, 2) AS INTEGER) <= 31
    ),
    Person_Long REAL NOT NULL CHECK (
        LENGTH(Person_Long) <= 999.9999999
        AND LENGTH(Person_Long) >= -999.9999999
    ),
    Person_Lat REAL NOT NULLCHECK (
        LENGTH(Person_Lat) <= 999.9999999
        AND LENGTH(Person_Lat) >= -999.9999999
    ),
    Points INTEGER NOT NULL CHECK(Points >= 0),
    PRIMARY KEY(Username)
);

CREATE TABLE PersonAllergens.PamPanDB(
    Username TEXT NOT NULL CHECK(LENGTH(Username) >= 3),
    Person_Allergen TEXT NOT NULL CHECK(
        Person_Allergen IN ('milk', 'eggs', 'fish', 'shellfish', 'nuts', 'wheat', 'soybean', 'other', 'none')
    ),
    PRIMARY KEY(Username, Person_Allergen),
    FOREIGN KEY(Username) REFERENCES Person(Username)
);

CREATE TABLE CategoryOfFood.PamPanDB(
    Category_Name TEXT NOT NULL CHECK(
        Category_Name IN ('bread', 'dairy', 'cheese', 'chicken', 'meats', 'fruits', 'vegetables', 'party', 'fish', 'other')
    ),
    PRIMARY KEY(Category_Name)
);

CREATE TABLE FoodShelter.PamPanDB(
    Shelter_Long REAL NOT NULL CHECK (
        LENGTH(Shelter_Long) <= 999.9999999
        AND LENGTH(Shelter_Long) >= -999.9999999
    ),
    Shelter_Lat REAL NOT NULL CHECK (
        LENGTH(Shelter_Lat) <= 999.9999999
        AND LENGTH(Shelter_Lat) >= -999.9999999
    ),
    Shelter_Name TEXT NOT NULL CHECK(
        LENGTH(Shelter_Name) >= 3
        AND LENGTH(Shelter_Name) <= 50
    ),
    PRIMARY KEY(Shelter_Long, Shelter_Lat)
);

CREATE TABLE FoodItem.PamPanDB(
    Item_Name TEXT NOT NULL CHECK(
        LENGTH(Item_Name) >= 3
        AND LENGTH(Item_Name) <= 30
    ),
    Expiry_Date TEXT NOT NULL CHECK(
        LENGTH(Expiry_Date) = 10
        AND GLOB '[0-9]-[0-9]-[0-9]'
        AND SUBSTR(Expiry_Date, 5, 1) = '-'
        AND SUBSTR(Expiry_Date, 8, 1) = '-',
        AND CAST(SUBSTR(Expiry_Date, 1, 4) AS INTEGER) >= CAST(STRFTIME('%Y', now) AS INTEGER)
        AND CAST(SUBSTR(Expiry_Date, 6, 2) AS INTEGER) >= 1
        AND CAST(SUBSTR(Expiry_Date, 6, 2) AS INTEGER) <= 12
        AND CAST(SUBSTR(Expiry_Date, 9, 2) AS INTEGER) >= 1
        AND CAST(SUBSTR(Expiry_Date, 9, 2) AS INTEGER) <= 31
    ),
    Barcode TEXT,
    ProductionDate TEXT NOT NULL CHECK(
        AND ProductionDate != Date('now'),
    ),,
    Can_Refrigerate INTEGER NOT NULL CHECK(
        Can_Refrigerate IN '0', '1',
    ),
    Measurement_Unit TEXT NOT NULL CHECK(
       Measurement_Unit IN 'g', 'kg', 'mL', 'L', 'pieces',
    ),
    Quantity INTEGER NOT NULL CHECK(
        Quantity >= 0
    ),
    Category_Name TEXT NOT NULL CHECK(
        Category_Name IN ('bread', 'milk', 'cheese', 'chicken', 'meats', 'fruits', 'vegetables', 'other')
    ),
    PRIMARY KEY(Item_Name, Expiry_Date),
    FOREIGN KEY(Category_Name) REFERENCES CategoryOfFood(Category_Name)
);

CREATE TABLE FoodItemAllergen.PamPanDB(
    Item_Name TEXT NOT NULL CHECK(
        LENGTH(Item_Name) >= 3
        AND LENGTH(Item_Name) <= 30
    ),
    Expiry_Date TEXT NOT NULL CHECK(
        LENGTH(Expiry_Date) = 10
        AND GLOB '[0-9]-[0-9]-[0-9]'
        AND SUBSTR(Expiry_Date, 5, 1) = '-'
        AND SUBSTR(Expiry_Date, 8, 1) = '-',
        AND CAST(SUBSTR(Expiry_Date, 1, 4) AS INTEGER) >= CAST(STRFTIME('%Y', now) AS INTEGER)
        AND CAST(SUBSTR(Expiry_Date, 6, 2) AS INTEGER) >= 1
        AND CAST(SUBSTR(Expiry_Date, 6, 2) AS INTEGER) <= 12
        AND CAST(SUBSTR(Expiry_Date, 9, 2) AS INTEGER) >= 1
        AND CAST(SUBSTR(Expiry_Date, 9, 2) AS INTEGER) <= 31
    ),
    FoodItem_Allergen TEXT NOT NULL,
    PRIMARY KEY(Item_Name, Expiry_Date, FoodItem_Allergen),
    FOREIGN KEY(Item_Name, Expiry_Date) REFERENCES FoodItem(Item_Name, Expiry_Date)
);
""";

class LibDB {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          INITIALIZATION_STATEMENT,
        );
        print('Created DB!!');
      },
      version: 1,
    );
  }
}
