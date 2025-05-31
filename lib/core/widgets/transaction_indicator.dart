import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionIndicator extends StatelessWidget {
  String itemTitle;
  final int itemColor;
  TransactionIndicator({
    super.key,
    required this.itemTitle,
    required this.itemColor,
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
          TextSpan(text: '23:00'),
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
