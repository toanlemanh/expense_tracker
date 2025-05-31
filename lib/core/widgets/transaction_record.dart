import 'package:expense_tracker/core/widgets/transaction_indicator.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

var indicatorId =
    0; // Biến toàn cục để xác định có hiển thị indicator hay không

class TransactionRecord extends StatelessWidget {
  final String title;
  final int itemColor;
  const TransactionRecord({
    required this.title,
    required this.itemColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    indicatorId++; // Tăng biến toàn cục mỗi khi tạo một TransactionRecord mới
    return TimelineTile(
      lineXY: 0.05,
      alignment: TimelineAlign.manual,
      isFirst: false,
      hasIndicator: true,
      indicatorStyle: IndicatorStyle(
        width: 80,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        drawGap: indicatorId % 2 == 0,
        indicator:
           indicatorId % 2 == 0
                ? TransactionIndicator(itemColor: itemColor, itemTitle: title)
                : const SizedBox(
                  width: 60,
                  height: 30,
                ), // 👈 Placeholder to keep layout
      ),
      beforeLineStyle: LineStyle(color: Color(itemColor)),
      endChild: buildTransactionTile(context),
    );
  }

  Widget buildTransactionTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(itemColor), // sử dụng itemColor
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          // tileColor: Color(0xFFC7E9E8),
          contentPadding: EdgeInsets.only(left: 8, right: 20),
          dense: true, // giảm khoảng cách giữa các dòng
          title: Row(
            children: [
              Text(title),
              const Icon(Icons.food_bank),
              const Icon(Icons.gamepad),
            ],
          ),
          subtitle: const Text('23:05'),
          leading: SizedBox(
            width: 50,
            height: 50,

            child: Container(
              // padding: EdgeInsets.all(2.0),
              // color: Colors.black.withOpacity(0.5),
              decoration:
              // foregroundDecoration:
              BoxDecoration(
                color: Color(0xff45e0fc), // lớp phủ đen mờ
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(child: Icon(Icons.shop, color: Colors.black)),
            ),
          ),
          trailing: Text(
            '-12000',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 90, 7),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
