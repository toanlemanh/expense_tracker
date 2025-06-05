// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecordStore on _RecordStoreBase, Store {
  Computed<int>? _$lengthComputed;

  @override
  int get length => (_$lengthComputed ??=
          Computed<int>(() => super.length, name: '_RecordStoreBase.length'))
      .value;

  late final _$_recordsAtom =
      Atom(name: '_RecordStoreBase._records', context: context);

  @override
  List<Record> get _records {
    _$_recordsAtom.reportRead();
    return super._records;
  }

  @override
  set _records(List<Record> value) {
    _$_recordsAtom.reportWrite(value, super._records, () {
      super._records = value;
    });
  }

  late final _$fetchRecordsDataAsyncAction =
      AsyncAction('_RecordStoreBase.fetchRecordsData', context: context);

  @override
  Future<void> fetchRecordsData() {
    return _$fetchRecordsDataAsyncAction.run(() => super.fetchRecordsData());
  }

  @override
  String toString() {
    return '''
length: ${length}
    ''';
  }
}
