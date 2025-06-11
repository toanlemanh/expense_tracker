// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssetStore on _AssetStoreBase, Store {
  late final _$_assetsAtom = Atom(
    name: '_AssetStoreBase._assets',
    context: context,
  );

  @override
  List<Asset> get _assets {
    _$_assetsAtom.reportRead();
    return super._assets;
  }

  @override
  set _assets(List<Asset> value) {
    _$_assetsAtom.reportWrite(value, super._assets, () {
      super._assets = value;
    });
  }

  late final _$fetchAssettDataAsyncAction = AsyncAction(
    '_AssetStoreBase.fetchAssettData',
    context: context,
  );

  @override
  Future<void> fetchAssettData() {
    return _$fetchAssettDataAsyncAction.run(() => super.fetchAssettData());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
