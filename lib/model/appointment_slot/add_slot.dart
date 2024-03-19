import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';

class AddSlot {
  AddSlot({
    bool? status,
    String? message,
    List<Slots>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  AddSlot.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Slots.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<Slots>? _data;

  AddSlot copyWith({
    bool? status,
    String? message,
    List<Slots>? data,
  }) =>
      AddSlot(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<Slots>? get data => _data;

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
