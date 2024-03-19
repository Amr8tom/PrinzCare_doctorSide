class Notification {
  Notification({
    bool? status,
    String? message,
    List<NotificationData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  Notification.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(NotificationData.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<NotificationData>? _data;

  Notification copyWith({
    bool? status,
    String? message,
    List<NotificationData>? data,
  }) =>
      Notification(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<NotificationData>? get data => _data;

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

class NotificationData {
  NotificationData({
    int? id,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  NotificationData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _title;
  String? _description;
  String? _createdAt;
  String? _updatedAt;

  NotificationData copyWith({
    int? id,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) =>
      NotificationData(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get title => _title;

  String? get description => _description;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
