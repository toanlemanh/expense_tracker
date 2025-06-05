class Record {
  final int? id;
  final int money;
  final String? remark;
  final int time;
  final int createTime;
  final int recordTypeId;
  final int? assetsId;
  final int recurrenceId;
  final int ledgerId;
  final int star;

  Record({
    this.id,
    required this.money,
    this.remark,
    required this.time,
    required this.createTime,
    required this.recordTypeId,
    this.assetsId,
    required this.recurrenceId,
    required this.ledgerId,
    required this.star,
  });

  factory Record.fromMap(Map<String, dynamic> map) {
    return Record(
      id: map['id'] as int?,
      money: map['money'] ?? 0,
      remark: map['remark'],
      time: map['time'] ?? 0,
      createTime: map['create_time'] ?? 0,
      recordTypeId: map['record_type_id'],
      assetsId: map['assets_id'],
      recurrenceId: map['recurrence_id'],
      ledgerId: map['ledger_id'],
      star: map['star'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'money': money,
      'remark': remark,
      'time': time,
      'create_time': createTime,
      'record_type_id': recordTypeId,
      'assets_id': assetsId,
      'recurrence_id': recurrenceId,
      'ledger_id': ledgerId,
      'star': star,
    };
  }
}