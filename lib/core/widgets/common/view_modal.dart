import 'package:expense_tracker/core/colors/app_colors.dart';
import 'package:expense_tracker/core/extensions/date_time_format.dart';
import 'package:expense_tracker/core/widgets/common/card_image.dart';
import 'package:expense_tracker/data/sharedpref/constants/preferences.dart';
import 'package:expense_tracker/features/record/service/record_type_service.dart';
import 'package:expense_tracker/features/record/viewmodel/record_store.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/features/record/model/record.dart';
import 'package:provider/provider.dart';

class ViewModal extends StatelessWidget {
  final int? id;
  final bool isIncome;

  const ViewModal({super.key, required this.id, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    final RecordStore recordStore = Provider.of<RecordStore>(context);
    final RecordTypeService recordTypeService = Provider.of<RecordTypeService>(
      context,
    );
    final Record record = recordStore.getRecordById(id!);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 320,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: appColors['pannel'],
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child:
            // Observer(
            //   builder:
            //       (context) =>
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            child: FutureBuilder(
                              future: recordTypeService.getRecordType(record.recordTypeId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  );
                                } else if (snapshot.hasError || !snapshot.hasData) {
                                  return Icon(Icons.error, size: 30);
                                } else {
                                  final recordType = snapshot.data!;
                                  return CardImageSquare(
                                    imagePath: '${Preferences.asset_png_path}${recordType.imgName}',
                                    autoBackground: true,
                                    size: Size(30, 30),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${record.id}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
                                // WidgetSpan(child: SizedBox(width: 10)),
                                TextSpan(
                                  text:
                                      "${isIncome ? '+' : '-'} ${record.money}",
                                  style: TextStyle(
                                    color:
                                        isIncome
                                            ? appColors['astrograniteDebris']
                                            : appColors['fuzzyWuzzyBrown'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Date"),
                    Text(
                      DateTime.fromMillisecondsSinceEpoch(
                        record.createTime,
                      ).getMonthAndDayAndYear(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Time"),
                    Text(
                      DateTime.fromMillisecondsSinceEpoch(
                        record.createTime,
                      ).getHourAndMinute(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("Asset"), Text('Cash')],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("Ledger"), Text('Default ledger')],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text("${record.remark}")],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10.0,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: appColors['background'],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.draw_rounded),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: appColors['background'],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.archive_rounded),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: appColors['background'],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.star_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //),
          ),
        ),
      ),
    );
  }
}
