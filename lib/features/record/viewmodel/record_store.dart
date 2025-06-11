import 'dart:async';

import 'package:expense_tracker/core/extensions/iterable_first_maker.dart';
import 'package:expense_tracker/features/record/service/record_service.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:expense_tracker/features/record/model/record.dart';
part 'record_store.g.dart';

class RecordStore = _RecordStoreBase with _$RecordStore;

abstract class _RecordStoreBase with Store {
  //Record service contains api to connect and interact with DB
  late final RecordService _recordService;

  @observable
  List<Record> _records = [];

  @computed
  int get length => _records.length;

  @computed
  List<Record> get records => _records;

  _RecordStoreBase(RecordService recordService) {
    debugPrint("recordStore: init");
    _recordService = recordService;
    fetchRecordsData();
  }
  
  @computed
  List<RecordDto> get filteredRecords =>
      IterableFirstMaker.markFirstDateAndHourItems(
        _records.map((record) => RecordDto(record: record)).toList()
      );

  @action
  Future<void> fetchRecordsData() async {
    // Example of fetching data using SqliteClient
    try {
      _records = await _recordService.getRecordsData();
      _records.forEach(
        (record) => print("Fetched Record: ${record.toMap()['money']}"),
      ); // equal to print("$asset");
      // Handle response data
    } catch (e) {
      // Handle error
      print('Failed to fetch record list: $e');
    }
  }

  Record getRecordById(int recordId) {
    try{
      // Possibly, you cannot find the index
      return _records.firstWhere((record) => record.id == recordId);
    } catch (e){
      print("Failed to get record by id");
      return Record.nullRecord();
    }
  }
}
