//tạo 1 service kết nối với DB hoặc gọi HTTP api
//taooj các hàm modifier DB ở đây
//store sẽ gọi vào service
//service singleton
import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';
import 'package:expense_tracker/features/record/model/record_type.dart';

class RecordTypeService {
  late final DioClient? _dioClient;
  late final SqfliteClient _sqfliteClient;
  static RecordTypeService? _instance;

  RecordTypeService._internal({dioClient, required sqfliteClient}) {
    _dioClient = dioClient;
    _sqfliteClient = sqfliteClient;
  }

  factory RecordTypeService({dioClient, required sqfliteClient}) =>
      _instance ??
      RecordTypeService._internal(
        dioClient: dioClient,
        sqfliteClient: sqfliteClient,
      );

  Future<List<RecordType>> getRecordTypesData() async {
    try {
      final db = await _sqfliteClient.openConnectionToDb();
      final List<Map<String, dynamic>> maps = await db.query('recordtype');
      List<RecordType> records = maps.map((map) => RecordType.fromMap(map)).toList();
      print("Fetched record type: $maps");
      return records;
    } catch (e) {
      throw Exception('Service: Failed to fetch record types list: $e');
    }
  }

  Future<RecordType> getRecordType(int id) async {
    try {
      final db = await _sqfliteClient.openConnectionToDb();
      final List<Map<String, dynamic>> maps = await db.query(
        'recordtype',
        where: 'id = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return RecordType.fromMap(maps.first);
      } else {
        throw Exception('RecordType with id $id not found');
      }
    } catch (e) {
      throw Exception('Service: Failed to fetch record types list: $e');
    }
  }
}
