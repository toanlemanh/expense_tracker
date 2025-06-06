import 'package:expense_tracker/core/data/local/sqflite/sqflite_client.dart';
import 'package:expense_tracker/features/asset/model/asset.dart';
import 'package:expense_tracker/features/asset/service/asset_service.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:expense_tracker/core/data/network/dio_client.dart';
part 'asset_store.g.dart';

class AssetStore = _AssetStoreBase with _$AssetStore;

abstract class _AssetStoreBase with Store {
   late final AssetService _assetService;

  _AssetStoreBase(AssetService assetService) {
    debugPrint("AssetStore: init");
    _assetService = assetService;
    fetchAssettData();
  }

  @observable
  List<Asset> _assets = [];

  @action
  Future<void> fetchAssettData() async {
    // Example of fetching data using SqliteClient
    try {
      _assets = await _assetService.getAssetData();
      _assets.forEach((asset) => 
        print("Fetched Asset: ${asset.toMap()['name']}")
      ); // equal to print("$asset");
      // Handle response data
    } catch (e) {
      // Handle error
       print('Failed to fetch asset list: $e');
    }
  }
}
