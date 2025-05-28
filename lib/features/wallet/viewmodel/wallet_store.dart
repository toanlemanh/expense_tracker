import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/features/wallet/service/wallet_service.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';
part 'wallet_store.g.dart';

class WalletStore = _WalletStoreBase with _$WalletStore;

abstract class _WalletStoreBase with Store {
   late final WalletService _walletService;

  _WalletStoreBase(WalletService walletService) {
    debugPrint("WalletStore: init");
    _walletService = walletService;
    fetchWalletData();
  }

  @observable
  String walletName = '';

  @observable
  double wallet_balance = 0.0;

  @observable
  String wallet_currency = 'USD';

  @observable
  String wallet_remark = '';

  @action
  void setWalletName(String name) {
    walletName = name;
  }

  @computed
  bool get isWalletNameValid => walletName.isNotEmpty;

  @action
  Future<void> fetchWalletData() async {
    // Example of fetching data using SqliteClient
    try {
      _walletService.fetchWalletData();
      
      // Handle response data
    } catch (e) {
      // Handle error
    }
  }
}
