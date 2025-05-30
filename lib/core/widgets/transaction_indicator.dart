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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "23:00",
            style: TextStyle(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Icon(
              CupertinoIcons.arrowtriangle_right_fill,
              size: 16,
              color: Color(itemColor),
              shadows: [
                Shadow(
                  offset: Offset(1, 2),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
