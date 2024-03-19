class WalletStatement {
  WalletStatement({
    bool? status,
    String? message,
    List<WalletStatementData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  WalletStatement.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(WalletStatementData.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<WalletStatementData>? _data;

  WalletStatement copyWith({
    bool? status,
    String? message,
    List<WalletStatementData>? data,
  }) =>
      WalletStatement(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<WalletStatementData>? get data => _data;

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

class WalletStatementData {
  WalletStatementData({
    int? id,
    int? doctorId,
    String? transactionId,
    String? appointmentNumber,
    int? type,
    num? amount,
    int? crOrDr,
    String? summary,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _doctorId = doctorId;
    _transactionId = transactionId;
    _appointmentNumber = appointmentNumber;
    _type = type;
    _amount = amount;
    _crOrDr = crOrDr;
    _summary = summary;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  WalletStatementData.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _transactionId = json['transaction_id'];
    _appointmentNumber = json['appointment_number'];
    _type = json['type'];
    _amount = json['amount'];
    _crOrDr = json['cr_or_dr'];
    _summary = json['summary'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _doctorId;
  String? _transactionId;
  String? _appointmentNumber;
  int? _type;
  num? _amount;
  int? _crOrDr;
  String? _summary;
  String? _createdAt;
  String? _updatedAt;

  WalletStatementData copyWith({
    int? id,
    int? doctorId,
    String? transactionId,
    String? appointmentNumber,
    int? type,
    num? amount,
    int? crOrDr,
    String? summary,
    String? createdAt,
    String? updatedAt,
  }) =>
      WalletStatementData(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        transactionId: transactionId ?? _transactionId,
        appointmentNumber: appointmentNumber ?? _appointmentNumber,
        type: type ?? _type,
        amount: amount ?? _amount,
        crOrDr: crOrDr ?? _crOrDr,
        summary: summary ?? _summary,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get doctorId => _doctorId;

  String? get transactionId => _transactionId;

  String? get appointmentNumber => _appointmentNumber;

  int? get type => _type;

  num? get amount => _amount;

  int? get crOrDr => _crOrDr;

  String? get summary => _summary;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['transaction_id'] = _transactionId;
    map['appointment_number'] = _appointmentNumber;
    map['type'] = _type;
    map['amount'] = _amount;
    map['cr_or_dr'] = _crOrDr;
    map['summary'] = _summary;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
