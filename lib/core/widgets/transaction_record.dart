import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/extensions/date_time_format.dart';
import 'package:expense_tracker/core/widgets/common/card_image.dart';
import 'package:expense_tracker/core/widgets/common/view_modal.dart';
import 'package:expense_tracker/core/widgets/transaction_indicator.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/features/record/model/record.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TransactionRecord extends StatelessWidget {
  final Record record;
  final String title;
  final int itemColor;
  final bool willBuildIndicator;
  final String imagePath;
  final bool isIncome;
  const TransactionRecord({
    required this.record,
    required this.title,
    required this.itemColor,
    required this.willBuildIndicator,
    required this.imagePath,
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
                  itemCreateHour: record.createTime,
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
                  fontFamily: 'JetBrainsMono',
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
            subtitle: Text(DateTime.fromMillisecondsSinceEpoch(record.createTime).getHourAndMinute()),
            leading: SizedBox(
              height: 50,
              width: 50,
              child: CardImageSquare(
                imagePath: imagePath,
                autoBackground: true,
              ),
            ),
            trailing: Text(
              "${isIncome ? '+' : '-'}${record.money}", //kiem tra neu record type id income hay expense
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
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context){
          //record index starts from 1 while id starts from 0
          return ViewModal(id: record.id, isIncome: isIncome);
        }),
    );
  }
}
