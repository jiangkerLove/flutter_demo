/// countId : ""
/// current : 0
/// maxLimit : 0
/// optimizeCountSql : true
/// orders : [{"asc":true,"column":""}]
/// pages : 0
/// records : [{"clockQuantity":0,"color":"","habitName":"","id":0,"plan":""}]
/// searchCount : true
/// size : 0
/// total : 0

class HabitListModel {
  HabitListModel({
    String? countId,
    num? current,
    num? maxLimit,
    bool? optimizeCountSql,
    List<Orders>? orders,
    num? pages,
    List<Records>? records,
    bool? searchCount,
    num? size,
    num? total,
  }) {
    _countId = countId;
    _current = current;
    _maxLimit = maxLimit;
    _optimizeCountSql = optimizeCountSql;
    _orders = orders;
    _pages = pages;
    _records = records;
    _searchCount = searchCount;
    _size = size;
    _total = total;
  }

  HabitListModel.fromJson(dynamic json) {
    _countId = json['countId'];
    _current = json['current'];
    _maxLimit = json['maxLimit'];
    _optimizeCountSql = json['optimizeCountSql'];
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
    _pages = json['pages'];
    if (json['records'] != null) {
      _records = [];
      json['records'].forEach((v) {
        _records?.add(Records.fromJson(v));
      });
    }
    _searchCount = json['searchCount'];
    _size = json['size'];
    _total = json['total'];
  }

  String? _countId;
  num? _current;
  num? _maxLimit;
  bool? _optimizeCountSql;
  List<Orders>? _orders;
  num? _pages;
  List<Records>? _records;
  bool? _searchCount;
  num? _size;
  num? _total;

  HabitListModel copyWith({
    String? countId,
    num? current,
    num? maxLimit,
    bool? optimizeCountSql,
    List<Orders>? orders,
    num? pages,
    List<Records>? records,
    bool? searchCount,
    num? size,
    num? total,
  }) =>
      HabitListModel(
        countId: countId ?? _countId,
        current: current ?? _current,
        maxLimit: maxLimit ?? _maxLimit,
        optimizeCountSql: optimizeCountSql ?? _optimizeCountSql,
        orders: orders ?? _orders,
        pages: pages ?? _pages,
        records: records ?? _records,
        searchCount: searchCount ?? _searchCount,
        size: size ?? _size,
        total: total ?? _total,
      );

  String? get countId => _countId;

  num? get current => _current;

  num? get maxLimit => _maxLimit;

  bool? get optimizeCountSql => _optimizeCountSql;

  List<Orders>? get orders => _orders;

  num? get pages => _pages;

  List<Records>? get records => _records;

  bool? get searchCount => _searchCount;

  num? get size => _size;

  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['countId'] = _countId;
    map['current'] = _current;
    map['maxLimit'] = _maxLimit;
    map['optimizeCountSql'] = _optimizeCountSql;
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    map['pages'] = _pages;
    if (_records != null) {
      map['records'] = _records?.map((v) => v.toJson()).toList();
    }
    map['searchCount'] = _searchCount;
    map['size'] = _size;
    map['total'] = _total;
    return map;
  }
}

/// clockQuantity : 0
/// color : ""
/// habitName : ""
/// id : 0
/// plan : ""

class Records {
  Records({
    num? clockQuantity,
    String? color,
    String? habitName,
    num? id,
    String? plan,
  }) {
    _clockQuantity = clockQuantity;
    _color = color;
    _habitName = habitName;
    _id = id;
    _plan = plan;
  }

  Records.fromJson(dynamic json) {
    _clockQuantity = json['clockQuantity'];
    _color = json['color'];
    _habitName = json['habitName'];
    _id = json['id'];
    _plan = json['plan'];
  }

  num? _clockQuantity;
  String? _color;
  String? _habitName;
  num? _id;
  String? _plan;

  Records copyWith({
    num? clockQuantity,
    String? color,
    String? habitName,
    num? id,
    String? plan,
  }) =>
      Records(
        clockQuantity: clockQuantity ?? _clockQuantity,
        color: color ?? _color,
        habitName: habitName ?? _habitName,
        id: id ?? _id,
        plan: plan ?? _plan,
      );

  num? get clockQuantity => _clockQuantity;

  String? get color => _color;

  String? get habitName => _habitName;

  num? get id => _id;

  String? get plan => _plan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clockQuantity'] = _clockQuantity;
    map['color'] = _color;
    map['habitName'] = _habitName;
    map['id'] = _id;
    map['plan'] = _plan;
    return map;
  }
}

/// asc : true
/// column : ""

class Orders {
  Orders({
    bool? asc,
    String? column,
  }) {
    _asc = asc;
    _column = column;
  }

  Orders.fromJson(dynamic json) {
    _asc = json['asc'];
    _column = json['column'];
  }

  bool? _asc;
  String? _column;

  Orders copyWith({
    bool? asc,
    String? column,
  }) =>
      Orders(
        asc: asc ?? _asc,
        column: column ?? _column,
      );

  bool? get asc => _asc;

  String? get column => _column;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['asc'] = _asc;
    map['column'] = _column;
    return map;
  }
}
