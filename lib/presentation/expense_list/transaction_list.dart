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
    // Placeholder for transaction items
    return Observer(
      builder:
          (context) => ListView.builder(
            itemCount: recordStore.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              List<Widget> widgets = [];

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
                    createTime: recordStore.records[index].createTime,
                  ),
                );
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
