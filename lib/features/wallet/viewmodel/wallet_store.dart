import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/features/wallet/model/wallet.dart';
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
  List<Wallet> _wallets = [];

  @action
  Future<void> fetchWalletData() async {
    // Example of fetching data using SqliteClient
    try {
      _wallets = await _walletService.fetchWalletData();
      _wallets.forEach((wallet) {
        debugPrint("Wallet: ${wallet.walletTitle}, Balance: ${wallet.walletBalance}");
      });
      // Handle response data
    } catch (e) {
      // Handle error
    }
  }
}
