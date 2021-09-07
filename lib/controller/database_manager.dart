import 'dart:async';
import 'dart:io';
import 'package:praxis/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {

  static final DatabaseManager db = DatabaseManager._();
  DatabaseManager._();

  //Tables
  static const USERS = "USERS";

  Database? _database;
  Directory? documentsDirectory;
  String? path;
  final int version = 1;
  static const database_name = "praxis.db";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    documentsDirectory = await getApplicationDocumentsDirectory();
    path = join(documentsDirectory!.path, database_name);
    var openDb = await openDatabase(path!, version: version, onUpgrade: (Database db, int oldVersion, int newVersion) async {

    }, onCreate: (Database db, int version) async {
      await createTable(USERS, User.columns(), db);
    });
    return openDb;
  }

  Future<void> inserts(String table, List<dynamic> objects) async {
    final db = await database;
    objects.forEach((object) async {
      await db.insert(table, object.toMap());
    });
  }

  Future<void> createTable(String table, List<String> columns, Database db) async {
    String query = "CREATE TABLE IF NOT EXISTS $table (";

    columns.forEach((column) {
      query += column;
    });

    query += ")";

    await db.execute(query);
  }

  Future<List<User>> getUsers() async {
    final db = await database;
    final result = await db.query(USERS);
    return result.isNotEmpty ? result.map((c) => User.fromJson(c)).toList() : [];
  }

  delete(String table, {String condition = ""}) async {
    final db = await database;
    await db.rawDelete("DELETE FROM $table $condition");
  }
}
