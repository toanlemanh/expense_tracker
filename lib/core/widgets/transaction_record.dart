import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/extensions/date_time_format.dart';

import 'package:expense_tracker/core/widgets/common/card_image.dart';
import 'package:expense_tracker/core/widgets/transaction_indicator.dart';
import 'package:flutter/material.dart';

import 'package:timeline_tile/timeline_tile.dart';

var indicatorId =
    0; // Biến toàn cục để xác định có hiển thị indicator hay không

class TransactionRecord extends StatelessWidget {
  final String title;
  final int itemColor;
  final int itemCreateHour;
  final bool willBuildIndicator;
  final String imagePath;
  final int money;
  final bool isIncome;
  const TransactionRecord({
    required this.title,
    required this.itemColor,
    required this.itemCreateHour,
    required this.willBuildIndicator,
    required this.imagePath,
    required this.money,
    required this.isIncome,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            isThreeLine: false,
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
              height: 50,
              width: 50,
              child: CardImageSquare(
                imagePath: imagePath,
                autoBackground: true,
                onTap: () {},
              ),
            ),
            trailing: Text(
              "${isIncome ? '+' : '-'}$money", //kiem tra neu record type id income hay expense
              style: TextStyle(
                color:
                    isIncome
                        ? appColors['astrograniteDebris']
                        : appColors['fuzzyWuzzyBrown'],
                fontSize: 14,
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
