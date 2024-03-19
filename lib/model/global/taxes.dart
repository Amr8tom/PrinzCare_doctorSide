class Taxes {
  Taxes({
    num? id,
    num? status,
    String? taxTitle,
    num? type,
    num? value,
    num? taxAmount,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _status = status;
    _taxTitle = taxTitle;
    _type = type;
    _value = value;
    _taxAmount = taxAmount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Taxes.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _taxTitle = json['tax_title'];
    _type = json['type'];
    _value = json['value'];
    _taxAmount = json['tax_amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _status;
  String? _taxTitle;
  num? _type;
  num? _value;
  num? _taxAmount;
  String? _createdAt;
  String? _updatedAt;

  void calculateTaxAmount(num subTotal) {
    num amount = 0;
    if (type == 0) {
      amount = ((subTotal * (value ?? 0)) / 100);
    }
    if (type == 1) {
      amount = value ?? 0;
    }
    _taxAmount = amount;
  }

  Taxes copyWith({
    num? id,
    num? status,
    String? taxTitle,
    num? type,
    num? value,
    num? taxAmount,
    String? createdAt,
    String? updatedAt,
  }) =>
      Taxes(
        id: id ?? _id,
        status: status ?? _status,
        taxTitle: taxTitle ?? _taxTitle,
        type: type ?? _type,
        value: value ?? _value,
        taxAmount: taxAmount ?? _taxAmount,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  num? get status => _status;

  String? get taxTitle => _taxTitle;

  num? get type => _type;

  num? get value => _value;

  num? get taxAmount => _taxAmount;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['tax_title'] = _taxTitle;
    map['type'] = _type;
    map['value'] = _value;
    map['tax_amount'] = _taxAmount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
