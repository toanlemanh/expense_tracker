import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/extensions/date_time_format.dart';
import 'package:expense_tracker/core/widgets/transaction_indicator.dart';
import 'package:expense_tracker/features/record/viewmodel/record_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

var indicatorId =
    0; // Biến toàn cục để xác định có hiển thị indicator hay không

class TransactionRecord extends StatelessWidget {
  final String title;
  final int itemColor;
  final int itemCreateHour;
  final bool willBuildIndicator;
  const TransactionRecord({
    required this.title,
    required this.itemColor,
    required this.itemCreateHour,
    required this.willBuildIndicator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('willBuildIndicator $willBuildIndicator');
    print('itemCreateHour ${DateTime.fromMillisecondsSinceEpoch(itemCreateHour).getHourLabel()}');

    // indicatorId++; // Tăng biến toàn cục mỗi khi tạo một TransactionRecord mới
    return TimelineTile(
      lineXY: 0.05,
      alignment: TimelineAlign.manual,
      isFirst: false,
      hasIndicator: true,
      indicatorStyle: IndicatorStyle(
        width: 80,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        drawGap: willBuildIndicator,
        indicator:
            willBuildIndicator
                ? TransactionIndicator(
                  itemColor: itemColor,
                  itemTitle: title,
                  itemCreateHour: itemCreateHour,
                )
                : const SizedBox(), //keep layout
      ),
      beforeLineStyle: LineStyle(color: Color(itemColor)),
      endChild: buildTransactionTile(context),
    );
  }

  Widget buildTransactionTile(BuildContext context) {
    return GestureDetector(
      child: Padding(
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
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: appColors['astrograniteDebris'],
                  fontSize: 16,
                ),
                children: [
                  TextSpan(text: title),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(Icons.food_bank, size: 18),
                    ),
                  ),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(Icons.gamepad, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            subtitle: const Text('23:05'),
            leading: SizedBox(
              width: 50,
              height: 50,

              child: Container(
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
                color: appColors['fuzzyWuzzyBrown'],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      onTap: () => print(title),
    );
  }
}
