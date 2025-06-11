import 'package:expense_tracker/core/widgets/transaction_record.dart';
import 'package:expense_tracker/core/widgets/transaction_summary.dart';
import 'package:expense_tracker/features/record/model/record_type.dart';
import 'package:expense_tracker/features/record/service/record_type_service.dart';
import 'package:expense_tracker/features/record/viewmodel/record_store.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionList extends StatelessWidget {
  late final ScrollController scrollController;
  TransactionList({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    late final recordStore = Provider.of<RecordStore>(context);
    late final recordTypeService = Provider.of<RecordTypeService>(context);

    // Placeholder for transaction items
    //TODO: create a collector gradually count income, expense and reset
    //each time meeting a transaction summary and stop.
    return Observer(
      builder:
          (context) => ListView.builder(
            itemCount: recordStore.length,
            controller: scrollController,
            itemBuilder:
                (context, index) =>
                    _buildRecord(recordStore, recordTypeService, index),
          ),
    );
  }


//build future widget because get record type is future 
  Widget _buildRecord(
    RecordStore recordStore,
    RecordTypeService recordTypeService,
    int index,
  ) {
    return FutureBuilder<RecordType>(
      future: recordTypeService.getRecordType(
        recordStore.records[index].recordTypeId,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }
        final recordType = snapshot.data!;
        final isIncome = recordStore.records[index].recordTypeId >= 29;
        List<Widget> widgets = [];

        widgets.add(
          TransactionRecord(
            title: '${recordType.name?.substring(10)}',
            itemColor: colors[index], // Use your color logic
            imagePath: 'assets/icons/categories/png/Car.png',
            itemCreateHour: recordStore.records[index].createTime,
            willBuildIndicator:
                recordStore.filteredRecords[index].isFirstHourItem,
            money: recordStore.records[index].money,
            isIncome: isIncome,
          ),
        );

        if (recordStore.filteredRecords[index].isFirstDateItem) {
          int _id = index;
          int _summaryIncome = 0;
          int _summaryExpense = 0;
          do {
            recordStore.records[_id].recordTypeId >= 29
                ? _summaryIncome += recordStore.records[_id].money
                : _summaryExpense += recordStore.records[_id].money;
            _id++;
          } while (_id < recordStore.length &&
              !recordStore.filteredRecords[_id].isFirstDateItem);
          widgets.insert(
            0,
            TransactionSummary(
              income: _summaryIncome,
              expense: _summaryExpense,
              createTime: recordStore.records[index].createTime,
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widgets,
        );
      },
    );
  }
}
