import 'dart:async';
import 'package:expense_tracker/features/record/model/record.dart';
import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';

class RecordService {
  late final DioClient? _dioClient;
  late final SqfliteClient _sqfliteClient;
  static RecordService? _instance;

  // Private named constructor
  RecordService._internal({
    DioClient? dioClient,
    required SqfliteClient sqfliteClient,
  }) {
    // print("RecordService init: ${_sqfliteClient.openConnectionToDb()}");
    _dioClient = dioClient;
    _sqfliteClient = sqfliteClient;
  }

  factory RecordService({DioClient? dioClient,required SqfliteClient sqfliteClient,}) =>
      _instance ??= RecordService._internal(
        dioClient: dioClient,
        sqfliteClient: sqfliteClient,
      );

  Future<List<Record>> getRecordsData() async {
    try {
      final db = await _sqfliteClient.openConnectionToDb();
      final List<Map<String, dynamic>> maps = await db.query('record');
      List<Record> records = maps.map((map) => Record.fromMap(map)).toList();
      print("Fetched record: $maps");
      return records;
    } catch (e) {
      throw Exception('Service: Failed to fetch records list: $e');
    }
  }
}
