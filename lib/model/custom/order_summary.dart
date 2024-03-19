import 'package:doctor_flutter/model/global/taxes.dart';

class OrderSummary {
  OrderSummary({
    num? serviceAmount,
    num? discountAmount,
    num? subtotal,
    num? totalTaxAmount,
    num? payableAmount,
    num? couponApply,
    CouponData? coupon,
    List<Taxes>? taxes,
  }) {
    _serviceAmount = serviceAmount;
    _discountAmount = discountAmount;
    _subtotal = subtotal;
    _totalTaxAmount = totalTaxAmount;
    _payableAmount = payableAmount;
    _couponApply = couponApply;
    _coupon = coupon;
    _taxes = taxes;
  }

  OrderSummary.fromJson(dynamic json) {
    _serviceAmount = json['service_amount'];
    _discountAmount = json['discount_amount'];
    _subtotal = json['subtotal'];
    _totalTaxAmount = json['total_tax_amount'];
    _payableAmount = json['payable_amount'];
    _couponApply = json['coupon_apply'];
    if (json['coupon'] != null) {
      _coupon =
          json['coupon'] != null ? CouponData.fromJson(json['coupon']) : null;
    }
    if (json['taxes'] != null) {
      _taxes = [];
      json['taxes'].forEach((v) {
        _taxes?.add(Taxes.fromJson(v));
      });
    }
  }

  num? _serviceAmount;
  num? _discountAmount;
  num? _subtotal;
  num? _totalTaxAmount;
  num? _payableAmount;
  num? _couponApply;
  CouponData? _coupon;
  List<Taxes>? _taxes;

  OrderSummary copyWith({
    num? serviceAmount,
    num? discountAmount,
    num? subtotal,
    num? totalTaxAmount,
    num? payableAmount,
    num? couponApply,
    CouponData? coupon,
    List<Taxes>? taxes,
  }) =>
      OrderSummary(
        serviceAmount: serviceAmount ?? _serviceAmount,
        discountAmount: discountAmount ?? _discountAmount,
        subtotal: subtotal ?? _subtotal,
        totalTaxAmount: totalTaxAmount ?? _totalTaxAmount,
        payableAmount: payableAmount ?? _payableAmount,
        couponApply: couponApply ?? _couponApply,
        coupon: coupon ?? _coupon,
        taxes: taxes ?? _taxes,
      );

  num? get serviceAmount => _serviceAmount;

  num? get discountAmount => _discountAmount;

  num? get subtotal => _subtotal;

  num? get totalTaxAmount => _totalTaxAmount;

  num? get payableAmount => _payableAmount;

  num? get couponApply => _couponApply;

  CouponData? get coupon => _coupon;

  List<Taxes>? get taxes => _taxes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['service_amount'] = _serviceAmount;
    map['discount_amount'] = _discountAmount;
    map['subtotal'] = _subtotal;
    map['total_tax_amount'] = _totalTaxAmount;
    map['payable_amount'] = _payableAmount;
    map['coupon_apply'] = _couponApply;
    if (_coupon != null) {
      map['coupon'] = _coupon?.toJson();
    }
    if (_taxes != null) {
      map['taxes'] = _taxes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CouponData {
  CouponData({
    int? id,
    String? coupon,
    int? percentage,
    int? maxDiscountAmount,
    String? heading,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _coupon = coupon;
    _percentage = percentage;
    _maxDiscountAmount = maxDiscountAmount;
    _heading = heading;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  CouponData.fromJson(dynamic json) {
    _id = json['id'];
    _coupon = json['coupon'];
    _percentage = json['percentage'];
    _maxDiscountAmount = json['max_discount_amount'];
    _heading = json['heading'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _coupon;
  int? _percentage;
  int? _maxDiscountAmount;
  String? _heading;
  String? _description;
  String? _createdAt;
  String? _updatedAt;

  CouponData copyWith({
    int? id,
    String? coupon,
    int? percentage,
    int? maxDiscountAmount,
    String? heading,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) =>
      CouponData(
        id: id ?? _id,
        coupon: coupon ?? _coupon,
        percentage: percentage ?? _percentage,
        maxDiscountAmount: maxDiscountAmount ?? _maxDiscountAmount,
        heading: heading ?? _heading,
        description: description ?? _description,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get coupon => _coupon;

  int? get percentage => _percentage;

  int? get maxDiscountAmount => _maxDiscountAmount;

  String? get heading => _heading;

  String? get description => _description;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['coupon'] = _coupon;
    map['percentage'] = _percentage;
    map['max_discount_amount'] = _maxDiscountAmount;
    map['heading'] = _heading;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
