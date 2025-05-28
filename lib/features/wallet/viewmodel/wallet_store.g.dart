// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WalletStore on _WalletStoreBase, Store {
  Computed<bool>? _$isWalletNameValidComputed;

  @override
  bool get isWalletNameValid => (_$isWalletNameValidComputed ??= Computed<bool>(
          () => super.isWalletNameValid,
          name: '_WalletStoreBase.isWalletNameValid'))
      .value;

  late final _$walletNameAtom =
      Atom(name: '_WalletStoreBase.walletName', context: context);

  @override
  String get walletName {
    _$walletNameAtom.reportRead();
    return super.walletName;
  }

  @override
  set walletName(String value) {
    _$walletNameAtom.reportWrite(value, super.walletName, () {
      super.walletName = value;
    });
  }

  late final _$wallet_balanceAtom =
      Atom(name: '_WalletStoreBase.wallet_balance', context: context);

  @override
  double get wallet_balance {
    _$wallet_balanceAtom.reportRead();
    return super.wallet_balance;
  }

  @override
  set wallet_balance(double value) {
    _$wallet_balanceAtom.reportWrite(value, super.wallet_balance, () {
      super.wallet_balance = value;
    });
  }

  late final _$wallet_currencyAtom =
      Atom(name: '_WalletStoreBase.wallet_currency', context: context);

  @override
  String get wallet_currency {
    _$wallet_currencyAtom.reportRead();
    return super.wallet_currency;
  }

  @override
  set wallet_currency(String value) {
    _$wallet_currencyAtom.reportWrite(value, super.wallet_currency, () {
      super.wallet_currency = value;
    });
  }

  late final _$wallet_remarkAtom =
      Atom(name: '_WalletStoreBase.wallet_remark', context: context);

  @override
  String get wallet_remark {
    _$wallet_remarkAtom.reportRead();
    return super.wallet_remark;
  }

  @override
  set wallet_remark(String value) {
    _$wallet_remarkAtom.reportWrite(value, super.wallet_remark, () {
      super.wallet_remark = value;
    });
  }

  late final _$fetchWalletDataAsyncAction =
      AsyncAction('_WalletStoreBase.fetchWalletData', context: context);

  @override
  Future<void> fetchWalletData() {
    return _$fetchWalletDataAsyncAction.run(() => super.fetchWalletData());
  }

  late final _$_WalletStoreBaseActionController =
      ActionController(name: '_WalletStoreBase', context: context);

  @override
  void setWalletName(String name) {
    final _$actionInfo = _$_WalletStoreBaseActionController.startAction(
        name: '_WalletStoreBase.setWalletName');
    try {
      return super.setWalletName(name);
    } finally {
      _$_WalletStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
walletName: ${walletName},
wallet_balance: ${wallet_balance},
wallet_currency: ${wallet_currency},
wallet_remark: ${wallet_remark},
isWalletNameValid: ${isWalletNameValid}
    ''';
  }
}
