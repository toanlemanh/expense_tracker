import 'package:expense_tracker/core/extensions/date_time_format.dart';
import 'package:expense_tracker/features/record/model/record.dart';

class IterableFirstMaker {
  static List<RecordDto> markFirstDateAndHourItems(List<RecordDto> recordDtos) {
//moi ngay la mot key khac nhau: khong lay theo phut 
    int? lastDateKey;
    int? lastHour;

    for (var recordDto in recordDtos) {
      DateTime curDateTime = DateTime.fromMillisecondsSinceEpoch(recordDto.record.createTime);
      int curHour = curDateTime.hour;
      int curDateKey =
          curDateTime.year * 10000 + curDateTime.month * 100 + curDateTime.day;
      //print("lastDateKey $lastDateKey vs curDateKey $curDateKey");
      // Mark first item of a new date
      if (lastDateKey != curDateKey) {
        recordDto.isFirstDateItem = true;
        lastDateKey = curDateKey;
        lastHour = null; // Reset hour for new date
        
      }
      // Mark first item of a new hour within the same date
      if (lastHour != curHour) {
        recordDto.isFirstHourItem = true;
        lastHour = curHour;
      }
     // print('Hour ${DateTime.fromMillisecondsSinceEpoch(curHour).getHourLabel()}');
    }
    return recordDtos;
  }
}
