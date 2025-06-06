import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/extensions/date_time_format.dart';
import 'package:expense_tracker/features/record/viewmodel/record_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TransactionIndicator extends StatelessWidget {
  final String itemTitle;
  final int itemColor;
  final int itemCreateHour;
  const TransactionIndicator({
    super.key,
    required this.itemTitle,
    required this.itemColor,
    required this.itemCreateHour,
  });

  void showTransactionDetail() {
    print('Transaction detail shown');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showTransactionDetail,
      child: 
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: appColors['astrograniteDebris']),
              children: [
                TextSpan(text: DateTime.fromMillisecondsSinceEpoch(itemCreateHour).getHourLabel()),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.arrow_right_rounded,
                    size: 30,
                    color: appColors['fuzzyWuzzyBrown'],
                  ),
                ),
              ],
            ),
          ),
        ),
      )



    );
  }
}
