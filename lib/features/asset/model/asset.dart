class Asset {
  final int? id;
  final String name;
  final String imgName;
  final int type;
  final int state; // soft delete flag
  final String remark;
  final int createTime;
  final int money;
  final int? ranking;
  final int initMoney;

  Asset({
    this.id,
    required this.name,
    required this.imgName,
    required this.type,
    required this.state,
    required this.remark,
    required this.createTime,
    required this.money,
    this.ranking,
    required this.initMoney,
  });

  // Convert from Map (e.g. from SQLite)
  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      id: map['id'],
      name: map['name'],
      imgName: map['img_name'],
      type: map['type'],
      state: map['state'],
      remark: map['remark'],
      createTime: map['create_time'],
      money: map['money'],
      ranking: map['ranking'],
      initMoney: map['init_money'],
    );
  }

  // Convert to Map (e.g. for SQLite)
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'img_name': imgName,
      'type': type,
      'state': state,
      'remark': remark,
      'create_time': createTime,
      'money': money,
      'ranking': ranking,
      'init_money': initMoney,
    };
  }
}
