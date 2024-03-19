class EarningHistory {
  EarningHistory({
    bool? status,
    String? message,
    List<EarningHistoryData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  EarningHistory.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(EarningHistoryData.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<EarningHistoryData>? _data;

  EarningHistory copyWith({
    bool? status,
    String? message,
    List<EarningHistoryData>? data,
  }) =>
      EarningHistory(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<EarningHistoryData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class EarningHistoryData {
  EarningHistoryData({
    int? id,
    int? doctorId,
    int? appointmentId,
    String? earningNumber,
    num? amount,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _doctorId = doctorId;
    _appointmentId = appointmentId;
    _earningNumber = earningNumber;
    _amount = amount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  EarningHistoryData.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _appointmentId = json['appointment_id'];
    _earningNumber = json['earning_number'];
    _amount = json['amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _doctorId;
  int? _appointmentId;
  String? _earningNumber;
  num? _amount;
  String? _createdAt;
  String? _updatedAt;

  EarningHistoryData copyWith({
    int? id,
    int? doctorId,
    int? appointmentId,
    String? earningNumber,
    num? amount,
    String? createdAt,
    String? updatedAt,
  }) =>
      EarningHistoryData(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        appointmentId: appointmentId ?? _appointmentId,
        earningNumber: earningNumber ?? _earningNumber,
        amount: amount ?? _amount,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get doctorId => _doctorId;

  int? get appointmentId => _appointmentId;

  String? get earningNumber => _earningNumber;

  num? get amount => _amount;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int date() {
    DateTime time = DateTime.parse(createdAt ?? '');
    return time.day;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['appointment_id'] = _appointmentId;
    map['earning_number'] = _earningNumber;
    map['amount'] = _amount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
