import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';
import 'package:expense_tracker/features/asset/model/asset.dart';

class AssetService {
  // class Service này tổng hợp tất cả các service liên quan đến DB và API (nếu cócó) 
  late final DioClient? _dioClient;
  late final SqfliteClient _sqfliteClient;
  static AssetService? _instance;

  // Private named constructor
  AssetService._internal({DioClient? dioClient, required SqfliteClient sqfliteClient}){
    // print("AssetService init: ${_sqfliteClient.openConnectionToDb()}");
    _dioClient = dioClient;
    _sqfliteClient = sqfliteClient;
  }
  
  factory AssetService({DioClient? dioClient, required SqfliteClient sqfliteClient}) {
    return _instance ??= AssetService._internal(dioClient : dioClient, sqfliteClient : sqfliteClient);
  }


  Future<List<Asset>> getAssetData() async {
    try {
      final db = await _sqfliteClient.openConnectionToDb();
      final List<Map<String, dynamic>> maps = await db.query('assets');
      List<Asset> assets = maps.map((map) => Asset.fromMap(map)).toList();
      print("Fetched Asset: $maps");
      return assets;
      
    } catch (e) {
      throw Exception('Service: Failed to fetch assets list: $e');
    }
  }
}