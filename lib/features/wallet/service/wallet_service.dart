import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';
import 'package:expense_tracker/features/wallet/model/wallet.dart';

class WalletService {
  // class Service này tổng hợp tất cả các service liên quan đến DB và API (nếu cócó) 
  late final DioClient? _dioClient;
  late final SqfliteClient _sqfliteClient;
  static WalletService? _instance;

  // Private named constructor
  WalletService._internal({DioClient? dioClient, required SqfliteClient sqfliteClient}){
    // print("WalletService init: ${_sqfliteClient.openConnectionToDb()}");
    _dioClient = dioClient;
    _sqfliteClient = sqfliteClient;
  }
  
  factory WalletService({DioClient? dioClient, required SqfliteClient sqfliteClient}) {
    return _instance ??= WalletService._internal(dioClient : dioClient, sqfliteClient : sqfliteClient);
  }


  Future<List<Wallet>> fetchWalletData() async {
    try {
      final db = await _sqfliteClient.openConnectionToDb();
      final List<Map<String, dynamic>> maps = await db.query('wallet');
      List<Wallet> wallets = maps.map((map) => Wallet.fromMap(map)).toList();
      // print("Fetched Wallets: $maps");
      return wallets;
      
    } catch (e) {
      throw Exception('Failed to fetch wallet data: $e');
    }
  }
}