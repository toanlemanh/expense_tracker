import 'package:expense_tracker/core/extensions/date_time_format.dart';
import 'package:expense_tracker/core/widgets/transaction_record.dart';
import 'package:expense_tracker/core/widgets/transaction_summary.dart';
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
    int _income = 0;
    int _expense = 0;
    // Placeholder for transaction items
    //TODO: create a collector gradually count income, expense and reset
    //each time meeting a transaction summary and stop.
    return Observer(
      builder:
          (context) => ListView.builder(
            itemCount: recordStore.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              List<Widget> widgets = [];

              recordStore.records[index].recordTypeId >= 29
                  ? _income += recordStore.records[index].money
                  : _expense += recordStore.records[index].money;

              // Always add the TransactionRecord
              widgets.add(
                TransactionRecord(
                  title: '${recordStore.records[index].money}',
                  itemColor: colors[index],
                  //${recordStore.records[index].recordTypeId}
                  imagePath: 'assets/icons/categories/png/Car.png',
                  itemCreateHour: recordStore.records[index].createTime,
                  willBuildIndicator:
                      recordStore.filteredRecords[index].isFirstHourItem,
                  money: recordStore.records[index].money,
                ),
              );

              // Additionally add TransactionSummary if condition is true
              if (recordStore.filteredRecords[index].isFirstDateItem) {
                widgets.insert(
                  0,
                  TransactionSummary(
                    income: _income,
                    expense: _expense,
                    createTime: recordStore.records[index].createTime,
                  ),
                );
                _income = 0;
                _expense = 0;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widgets,
              );
            },
          ),
    );
  }
}
