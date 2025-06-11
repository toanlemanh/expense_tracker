class RecordType {
  final int? id; // nullable vì sẽ được tự động tăng
  final String? name;
  final String? imgName;
  final int type;      // 0: expense, 1: income
  final int ranking;   // thứ tự hiển thị
  final int state;     // chưa rõ mục đích
  final int parentId;  // -1 nếu không có parent

  RecordType({
    this.id,
    this.name,
    this.imgName,
    required this.type,
    required this.ranking,
    required this.state,
    required this.parentId,
  });

  // Tạo từ Map (từ SQLite)
  factory RecordType.fromMap(Map<String, dynamic> map) {
    return RecordType(
      id: map['id'] as int?,
      name: map['name'] as String?,
      imgName: map['img_name'] as String?,
      type: map['type'] as int,
      ranking: map['ranking'] as int,
      state: map['state'] as int,
      parentId: map['parent_id'] as int,
    );
  }

  // Convert về Map (để insert/update SQLite)
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id, // chỉ thêm nếu có id
      'name': name,
      'img_name': imgName,
      'type': type,
      'ranking': ranking,
      'state': state,
      'parent_id': parentId,
    };
  }
}
