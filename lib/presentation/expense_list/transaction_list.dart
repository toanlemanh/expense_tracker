import 'package:expense_tracker/core/extensions/date_time_format.dart';
import 'package:expense_tracker/core/widgets/transaction_record.dart';
import 'package:expense_tracker/core/widgets/transaction_summary.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
   late final ScrollController scrollController;
  TransactionList({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    // Placeholder for transaction items
    return ListView.builder(
      itemCount: items.length, // Replace with your transaction count
      controller: scrollController,
      itemBuilder: (context, index) {
        // Replace with your transaction item widget
        if (index % 5 == 0){
          return TransactionSummary();
        }
        return TransactionRecord(
          title: items[index],
          itemColor: colors[index]
        );
      },
    );
  }
}