import 'dart:async';
import 'package:bunkify/models/data_models/subject.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {global} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE global(id TEXT PRIMARY KEY, name TEXT, type TEXT,attendCount INTEGER, totalCount INTEGER)',
    );
  }

  Future<void> createSubjectTable(SubjectData subject) async {
    final db = await _databaseService.database;
    final String subjectName = subject.name;
    await db.execute(
        "CREATE TABLE {$subjectName} (id TEXT PRIMARY KEY,date TEXT,didAttend integer,FOREIGN KEY (subject_id) REFERENCES subjects (id)");
    await _updateNewSubject(db, subject);
  }

  Future<void> _updateNewSubject(Database db, SubjectData subject) async {
    await db.insert(subject.name, subject.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
