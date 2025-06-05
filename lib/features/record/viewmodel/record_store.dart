import 'package:expense_tracker/features/record/service/record_service.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:expense_tracker/features/record/model/record.dart';
part 'record_store.g.dart';

class RecordStore = _RecordStoreBase with _$RecordStore;

abstract class _RecordStoreBase with Store {
  //Record service contains api to connect and interact with DB
  late final RecordService recordService;

  @observable
  List<Record> _records = [];

  @computed
  int get length => _records.length;

  _RecordStoreBase(recordService) {
    debugPrint("recordStore: init");
    recordService = recordService;
    fetchRecordsData();
  }

  @action
  Future<void> fetchRecordsData() async {
    // Example of fetching data using SqliteClient
    try {
      _records = await recordService.getRecordsData();
      _records.forEach(
        (record) => print("Fetched Record: ${record.toMap()['money']}"),
      ); // equal to print("$asset");
      // Handle response data
    } catch (e) {
      // Handle error
      print('Failed to fetch record list: $e');
    }
  }
}
