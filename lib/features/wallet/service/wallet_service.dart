import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';

class WalletService {
  // class Service này tổng hợp tất cả các service liên quan đến DB và API (nếu cócó) 
  final DioClient _dioClient = DioClient();
  final SqfliteClient _sqfliteClient = SqfliteClient();
  static final WalletService _instance = WalletService._internal();

  // Private named constructor
  WalletService._internal(){
    // print("WalletService init: ${_sqfliteClient.openConnectionToDb()}");
    fetchWalletData();

  }
  // Public factory always returns the same instance
  factory WalletService() => _instance;


  Future<void> fetchWalletData() async {
    try {
      final db = await _sqfliteClient.openConnectionToDb();
      final List<Map<String, dynamic>> maps = await db.query('wallet');
      print("Fetched Wallets: $maps");
      
      
    } catch (e) {
      throw Exception('Failed to fetch wallet data: $e');
    }
  }
}