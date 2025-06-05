extension DateTimeFormat on DateTime{
  String getHourLabel() {
    //returns hour in 'HH:00' format
    return '${hour.toString().padLeft(2, '0')}:00';
  }

  String getDateLabel() {
    //returns hour in 'May 28' format
    return '$month $day';
  }

    String getWeekDayLabel() {
    //returns hour in 'Wed' format
    const List<String> weekdays = [
      'mon', 'tue', 'wed', 'thu', 'fri', 'sad', 'sun'
    ];
    return weekdays[weekday-1];
  }
}