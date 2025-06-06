import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/extensions/date_time_format.dart';
import 'package:expense_tracker/features/record/model/record.dart';
import 'package:expense_tracker/features/record/viewmodel/record_store.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class TransactionSummary extends StatelessWidget {
  final int createTime;
  const TransactionSummary({required this.createTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateTime.fromMillisecondsSinceEpoch(createTime).getDateLabel(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: appColors['background'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(DateTime.fromMillisecondsSinceEpoch(createTime).getWeekDayLabel()),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'JetBrainsMono',
                      fontWeight: FontWeight.bold,
                      color: appColors['astrograniteDebris'],
                    ),
                    children: [
                      TextSpan(text: '+0'),
                      WidgetSpan(child: SizedBox(width: 10)),
                      TextSpan(
                        text: '-250000',
                        style: TextStyle(color: appColors['fuzzyWuzzyBrown']),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
