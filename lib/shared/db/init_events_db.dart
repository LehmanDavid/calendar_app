import 'dart:async';
import '../const/consts.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class InitEventsDatabase {
  static final InitEventsDatabase instance = InitEventsDatabase._init();
  static Database? _database;
  InitEventsDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(filePathToDB);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(""" 
    CREATE TABLE $eventsTable (
     ${EventFields.name} $textType,
     ${EventFields.description} $textType,
     ${EventFields.location} $textType,
     ${EventFields.color} $colorType,
     ${EventFields.time} $textType,
     ${EventFields.date} $textType,
     ${EventFields.id} $idType
    )
    """);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
