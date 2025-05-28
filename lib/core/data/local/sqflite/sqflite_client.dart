// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
import 'package:expense_tracker/core/data/local/constants/database_constants.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

//singleton sqflite client
class SqfliteClient{
  static final SqfliteClient _service = SqfliteClient._internal();

  //private named constructor
  SqfliteClient._internal();

  //public factory always return service
  factory SqfliteClient() => _service;

  static Database? _database;

  Future<Database> openConnectionToDb() async {
  
// Open the database and store the reference.
    debugPrint('SQflite Clinet: open Connection To DB');
   
    return _database ?? await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
        version: 1,
        join(await getDatabasesPath(), DatabaseConstants.databaseName),
        onCreate: (db, version) async {
          //first time create database => run init sql
          final sql = await rootBundle.loadString('assets/db/init_new.sql');
          final batch = db.batch();
          for (var query in sql.split(';')) {
            final trimmedQuery = query.trim();
            if (trimmedQuery.isNotEmpty) {
              batch.execute(trimmedQuery);
            }
          }
          var result = await batch.commit(noResult: true);
          debugPrint('Init Result $result');
        }
    );
  }

  Future<void> closeConnection() async {
    await _database?.close();
    _database = null;
  }
}
