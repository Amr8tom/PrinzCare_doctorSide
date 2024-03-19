class FaqCat {
  FaqCat({
    bool? status,
    String? message,
    List<FaqCatData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  FaqCat.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(FaqCatData.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<FaqCatData>? _data;

  FaqCat copyWith({
    bool? status,
    String? message,
    List<FaqCatData>? data,
  }) =>
      FaqCat(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<FaqCatData>? get data => _data;

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

class FaqCatData {
  FaqCatData({
    int? id,
    String? title,
    String? createdAt,
    String? updatedAt,
    List<Faqs>? faqs,
  }) {
    _id = id;
    _title = title;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _faqs = faqs;
  }

  FaqCatData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['faqs'] != null) {
      _faqs = [];
      json['faqs'].forEach((v) {
        _faqs?.add(Faqs.fromJson(v));
      });
    }
  }

  int? _id;
  String? _title;
  String? _createdAt;
  String? _updatedAt;
  List<Faqs>? _faqs;

  FaqCatData copyWith({
    int? id,
    String? title,
    String? createdAt,
    String? updatedAt,
    List<Faqs>? faqs,
  }) =>
      FaqCatData(
        id: id ?? _id,
        title: title ?? _title,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        faqs: faqs ?? _faqs,
      );

  int? get id => _id;

  String? get title => _title;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<Faqs>? get faqs => _faqs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_faqs != null) {
      map['faqs'] = _faqs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Faqs {
  Faqs({
    int? id,
    int? categoryId,
    String? question,
    String? answer,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _categoryId = categoryId;
    _question = question;
    _answer = answer;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Faqs.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _question = json['question'];
    _answer = json['answer'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _categoryId;
  String? _question;
  String? _answer;
  String? _createdAt;
  String? _updatedAt;

  Faqs copyWith({
    int? id,
    int? categoryId,
    String? question,
    String? answer,
    String? createdAt,
    String? updatedAt,
  }) =>
      Faqs(
        id: id ?? _id,
        categoryId: categoryId ?? _categoryId,
        question: question ?? _question,
        answer: answer ?? _answer,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get categoryId => _categoryId;

  String? get question => _question;

  String? get answer => _answer;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['question'] = _question;
    map['answer'] = _answer;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
