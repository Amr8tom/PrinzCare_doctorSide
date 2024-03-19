class PayoutHistory {
  PayoutHistory({
    bool? status,
    String? message,
    List<PayoutHistoryData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  PayoutHistory.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PayoutHistoryData.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<PayoutHistoryData>? _data;

  PayoutHistory copyWith({
    bool? status,
    String? message,
    List<PayoutHistoryData>? data,
  }) =>
      PayoutHistory(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<PayoutHistoryData>? get data => _data;

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

class PayoutHistoryData {
  PayoutHistoryData({
    int? id,
    String? requestNumber,
    int? status,
    int? doctorId,
    int? amount,
    String? summary,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _requestNumber = requestNumber;
    _status = status;
    _doctorId = doctorId;
    _amount = amount;
    _summary = summary;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  PayoutHistoryData.fromJson(dynamic json) {
    _id = json['id'];
    _requestNumber = json['request_number'];
    _status = json['status'];
    _doctorId = json['doctor_id'];
    _amount = json['amount'];
    _summary = json['summary'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _requestNumber;
  int? _status;
  int? _doctorId;
  int? _amount;
  String? _summary;
  String? _createdAt;
  String? _updatedAt;

  PayoutHistoryData copyWith({
    int? id,
    String? requestNumber,
    int? status,
    int? doctorId,
    int? amount,
    String? summary,
    String? createdAt,
    String? updatedAt,
  }) =>
      PayoutHistoryData(
        id: id ?? _id,
        requestNumber: requestNumber ?? _requestNumber,
        status: status ?? _status,
        doctorId: doctorId ?? _doctorId,
        amount: amount ?? _amount,
        summary: summary ?? _summary,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get requestNumber => _requestNumber;

  int? get status => _status;

  int? get doctorId => _doctorId;

  int? get amount => _amount;

  String? get summary => _summary;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['request_number'] = _requestNumber;
    map['status'] = _status;
    map['doctor_id'] = _doctorId;
    map['amount'] = _amount;
    map['summary'] = _summary;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
