import 'package:bunkify/data/database.dart';
import 'package:bunkify/models/data_models/subject.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  late Database db;

  DatabaseHandler._create() {
    if (kDebugMode) {
      print("_create() (private constructor)");
    }
  }

  /// Public factory
  static Future<DatabaseHandler> create() async {
    if (kDebugMode) print("create() (public factory)");

    // Call the private constructor
    DatabaseHandler component = DatabaseHandler._create();
    await component._init();

    // Do initialization that requires async
    //await component._complexAsyncInit();

    // Return the fully initialized object
    return component;
  }

  Future<void> _init() async {
    db = await DatabaseService().database;
  }

  Future<void> _updateNewSubject(SubjectData subject) async {
    await db.insert("global", subject.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> createSubjectTable(SubjectData subject) async {
    final String subjectName = subject.name;
    await db.execute(
        "CREATE TABLE $subjectName (id TEXT PRIMARY KEY,date TEXT,didAttend integer);");
    await _updateNewSubject(subject);
  }

  Future<void> viewDataBase() async {
    List<Map<String, dynamic>> data = await db.query('global');
    print(data);
  }
}
