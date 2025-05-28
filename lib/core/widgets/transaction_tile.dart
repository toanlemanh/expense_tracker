import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final int itemColor;
  const TransactionTile({
    required this.title,
    required this.itemColor, // sửa ở đây
    Key? key, // sửa kiểu `key`
  }) : super(key: key); // truyền `key` lên cha

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      lineXY: 0.05,
      alignment: TimelineAlign.manual,
      isFirst: false,
      hasIndicator: true,
  

      indicatorStyle: IndicatorStyle(
                    width: 60,
                    height: 30,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    drawGap: true,
                    indicator: Container(
                
                      alignment: Alignment.center,
                      child: const Text(
                          '23:00',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                          ),
                        ),
                      ),
                
                  ),
     
      beforeLineStyle: LineStyle(color: Color(itemColor)),
      endChild: buildContent(context),
      // startChild: Padding(
      //   padding: const EdgeInsets.all(5.0),
      //   child: const Text('23:05'),
      // ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFC7E9E8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          // tileColor: Color(0xFFC7E9E8),
          title: Row(
            children: [
              Text(title),
              const Icon(Icons.food_bank),
              const Icon(Icons.gamepad),
            ],
          ),
          subtitle: const Text('23:05'),
          leading: SizedBox(
            width: 40,
            height: 40,

            child: Container(
              // padding: EdgeInsets.all(2.0),
              // color: Colors.black.withOpacity(0.5),
              decoration:
              // foregroundDecoration:
              BoxDecoration(
                color: Color(0xff45e0fc), // lớp phủ đen mờ
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Icon(Icons.shop, color: Colors.black)),
            ),
          ),
          trailing: Text(
            '-12000',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
