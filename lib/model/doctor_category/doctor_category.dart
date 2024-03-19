class DoctorCategory {
  DoctorCategory({
    bool? status,
    String? message,
    List<DoctorCategoryData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  DoctorCategory.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DoctorCategoryData.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<DoctorCategoryData>? _data;

  DoctorCategory copyWith({
    bool? status,
    String? message,
    List<DoctorCategoryData>? data,
  }) =>
      DoctorCategory(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<DoctorCategoryData>? get data => _data;

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

class DoctorCategoryData {
  DoctorCategoryData({
    int? id,
    String? title,
    String? image,
    int? isDeleted,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _image = image;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  DoctorCategoryData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _isDeleted = json['is_deleted'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _title;
  String? _image;
  int? _isDeleted;
  String? _createdAt;
  String? _updatedAt;

  DoctorCategoryData copyWith({
    int? id,
    String? title,
    String? image,
    int? isDeleted,
    String? createdAt,
    String? updatedAt,
  }) =>
      DoctorCategoryData(
        id: id ?? _id,
        title: title ?? _title,
        image: image ?? _image,
        isDeleted: isDeleted ?? _isDeleted,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get title => _title;

  String? get image => _image;

  int? get isDeleted => _isDeleted;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['is_deleted'] = _isDeleted;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
