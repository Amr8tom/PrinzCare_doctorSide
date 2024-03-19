import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/model/user/fetch_user_detail.dart';

class AppointmentRequest {
  AppointmentRequest({
    bool? status,
    String? message,
    List<AppointmentData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  AppointmentRequest.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AppointmentData.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<AppointmentData>? _data;

  AppointmentRequest copyWith({
    bool? status,
    String? message,
    List<AppointmentData>? data,
  }) =>
      AppointmentRequest(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<AppointmentData>? get data => _data;

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

class AppointmentData {
  AppointmentData({
    int? id,
    String? appointmentNumber,
    int? status,
    int? doctorId,
    int? userId,
    int? patientId,
    String? problem,
    String? diagnosedWith,
    dynamic document,
    String? date,
    String? time,
    int? type,
    String? orderSummary,
    int? isCouponApplied,
    String? couponTitle,
    int? completionOtp,
    int? totalAmount,
    int? discountAmount,
    int? payableAmount,
    int? isRated,
    String? createdAt,
    String? updatedAt,
    List<AppointmentData>? previousAppointments,
    User? user,
    Patient? patient,
    DoctorData? doctor,
    List<Documents>? documents,
    Prescription? prescription,
    Rating? rating,
  }) {
    _id = id;
    _appointmentNumber = appointmentNumber;
    _status = status;
    _doctorId = doctorId;
    _userId = userId;
    _patientId = patientId;
    _problem = problem;
    _diagnosedWith = diagnosedWith;
    _document = document;
    _date = date;
    _time = time;
    _type = type;
    _orderSummary = orderSummary;
    _isCouponApplied = isCouponApplied;
    _couponTitle = couponTitle;
    _completionOtp = completionOtp;
    _totalAmount = totalAmount;
    _discountAmount = discountAmount;
    _payableAmount = payableAmount;
    _isRated = isRated;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _previousAppointments = previousAppointments;
    _user = user;
    _patient = patient;
    _doctor = doctor;
    _documents = documents;
    _prescription = prescription;
    _rating = rating;
  }

  AppointmentData.fromJson(dynamic json) {
    _id = json['id'];
    _appointmentNumber = json['appointment_number'];
    _status = json['status'];
    _doctorId = json['doctor_id'];
    _userId = json['user_id'];
    _patientId = json['patient_id'];
    _problem = json['problem'];
    _diagnosedWith = json['diagnosed_with'];
    _document = json['document'];
    _date = json['date'];
    _time = json['time'];
    _type = json['type'];
    _orderSummary = json['order_summary'];
    _isCouponApplied = json['is_coupon_applied'];
    _couponTitle = json['coupon_title'];
    _completionOtp = json['completion_otp'];
    _totalAmount = json['total_amount'];
    _discountAmount = json['discount_amount'];
    _payableAmount = json['payable_amount'].toInt();
    _isRated = json['is_rated'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['previous_appointments'] != null) {
      _previousAppointments = [];
      json['previous_appointments'].forEach((v) {
        _previousAppointments?.add(AppointmentData.fromJson(v));
      });
    }
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    _doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
    if (json['documents'] != null) {
      _documents = [];
      json['documents'].forEach((v) {
        _documents?.add(Documents.fromJson(v));
      });
    }
    _prescription = json['prescription'] != null
        ? Prescription.fromJson(json['prescription'])
        : null;
    _rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  int? _id;
  String? _appointmentNumber;
  int? _status;
  int? _doctorId;
  int? _userId;
  int? _patientId;
  String? _problem;
  String? _diagnosedWith;
  dynamic _document;
  String? _date;
  String? _time;
  int? _type;
  String? _orderSummary;
  int? _isCouponApplied;
  String? _couponTitle;
  int? _completionOtp;
  int? _totalAmount;
  int? _discountAmount;
  int? _payableAmount;
  int? _isRated;
  String? _createdAt;
  String? _updatedAt;
  List<AppointmentData>? _previousAppointments;
  User? _user;
  Patient? _patient;
  DoctorData? _doctor;
  List<Documents>? _documents;
  Prescription? _prescription;
  Rating? _rating;

  AppointmentData copyWith({
    int? id,
    String? appointmentNumber,
    int? status,
    int? doctorId,
    int? userId,
    int? patientId,
    String? problem,
    String? diagnosedWith,
    dynamic document,
    String? date,
    String? time,
    int? type,
    String? orderSummary,
    int? isCouponApplied,
    String? couponTitle,
    int? completionOtp,
    int? totalAmount,
    int? discountAmount,
    int? payableAmount,
    int? isRated,
    String? createdAt,
    String? updatedAt,
    List<AppointmentData>? previousAppointments,
    User? user,
    Patient? patient,
    DoctorData? doctor,
    List<Documents>? documents,
    Prescription? prescription,
    Rating? rating,
  }) =>
      AppointmentData(
        id: id ?? _id,
        appointmentNumber: appointmentNumber ?? _appointmentNumber,
        status: status ?? _status,
        doctorId: doctorId ?? _doctorId,
        userId: userId ?? _userId,
        patientId: patientId ?? _patientId,
        problem: problem ?? _problem,
        diagnosedWith: diagnosedWith ?? _diagnosedWith,
        document: document ?? _document,
        date: date ?? _date,
        time: time ?? _time,
        type: type ?? _type,
        orderSummary: orderSummary ?? _orderSummary,
        isCouponApplied: isCouponApplied ?? _isCouponApplied,
        couponTitle: couponTitle ?? _couponTitle,
        completionOtp: completionOtp ?? _completionOtp,
        totalAmount: totalAmount ?? _totalAmount,
        discountAmount: discountAmount ?? _discountAmount,
        payableAmount: payableAmount ?? _payableAmount,
        isRated: isRated ?? _isRated,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        previousAppointments: previousAppointments ?? _previousAppointments,
        user: user ?? _user,
        patient: patient ?? _patient,
        doctor: doctor ?? _doctor,
        documents: documents ?? _documents,
        prescription: prescription ?? _prescription,
        rating: rating ?? _rating,
      );

  int? get id => _id;

  String? get appointmentNumber => _appointmentNumber;

  int? get status => _status;

  int? get doctorId => _doctorId;

  int? get userId => _userId;

  int? get patientId => _patientId;

  String? get problem => _problem;

  String? get diagnosedWith => _diagnosedWith;

  dynamic get document => _document;

  String? get date => _date;

  String? get time => _time;

  int? get type => _type;

  String? get orderSummary => _orderSummary;

  int? get isCouponApplied => _isCouponApplied;

  String? get couponTitle => _couponTitle;

  int? get completionOtp => _completionOtp;

  int? get totalAmount => _totalAmount;

  int? get discountAmount => _discountAmount;

  int? get payableAmount => _payableAmount;

  int? get isRated => _isRated;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<AppointmentData>? get previousAppointments => _previousAppointments;

  User? get user => _user;

  Patient? get patient => _patient;

  DoctorData? get doctor => _doctor;

  List<Documents>? get documents => _documents;

  Prescription? get prescription => _prescription;

  Rating? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['appointment_number'] = _appointmentNumber;
    map['status'] = _status;
    map['doctor_id'] = _doctorId;
    map['user_id'] = _userId;
    map['patient_id'] = _patientId;
    map['problem'] = _problem;
    map['diagnosed_with'] = _diagnosedWith;
    map['document'] = _document;
    map['date'] = _date;
    map['time'] = _time;
    map['type'] = _type;
    map['order_summary'] = _orderSummary;
    map['is_coupon_applied'] = _isCouponApplied;
    map['coupon_title'] = _couponTitle;
    map['completion_otp'] = _completionOtp;
    map['total_amount'] = _totalAmount;
    map['discount_amount'] = _discountAmount;
    map['payable_amount'] = _payableAmount;
    map['is_rated'] = _isRated;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_previousAppointments != null) {
      map['previous_appointments'] =
          _previousAppointments?.map((v) => v.toJson()).toList();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_patient != null) {
      map['patient'] = _patient?.toJson();
    }
    if (_doctor != null) {
      map['doctor'] = _doctor?.toJson();
    }
    if (_documents != null) {
      map['documents'] = _documents?.map((v) => v.toJson()).toList();
    }
    if (_prescription != null) {
      map['prescription'] = _prescription?.toJson();
    }
    if (_rating != null) {
      map['rating'] = _rating?.toJson();
    }
    return map;
  }
}

class Rating {
  Rating({
    int? id,
    int? userId,
    int? doctorId,
    int? appointmentId,
    int? rating,
    String? comment,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _doctorId = doctorId;
    _appointmentId = appointmentId;
    _rating = rating;
    _comment = comment;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Rating.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _doctorId = json['doctor_id'];
    _appointmentId = json['appointment_id'];
    _rating = json['rating'];
    _comment = json['comment'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _userId;
  int? _doctorId;
  int? _appointmentId;
  int? _rating;
  String? _comment;
  String? _createdAt;
  String? _updatedAt;

  Rating copyWith({
    int? id,
    int? userId,
    int? doctorId,
    int? appointmentId,
    int? rating,
    String? comment,
    String? createdAt,
    String? updatedAt,
  }) =>
      Rating(
        id: id ?? _id,
        userId: userId ?? _userId,
        doctorId: doctorId ?? _doctorId,
        appointmentId: appointmentId ?? _appointmentId,
        rating: rating ?? _rating,
        comment: comment ?? _comment,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get userId => _userId;

  int? get doctorId => _doctorId;

  int? get appointmentId => _appointmentId;

  int? get rating => _rating;

  String? get comment => _comment;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['doctor_id'] = _doctorId;
    map['appointment_id'] = _appointmentId;
    map['rating'] = _rating;
    map['comment'] = _comment;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Prescription {
  Prescription({
    int? id,
    int? appointmentId,
    int? userId,
    String? medicine,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _appointmentId = appointmentId;
    _userId = userId;
    _medicine = medicine;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Prescription.fromJson(dynamic json) {
    _id = json['id'];
    _appointmentId = json['appointment_id'];
    _userId = json['user_id'];
    _medicine = json['medicine'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _appointmentId;
  int? _userId;
  String? _medicine;
  String? _createdAt;
  String? _updatedAt;

  Prescription copyWith({
    int? id,
    int? appointmentId,
    int? userId,
    String? medicine,
    String? createdAt,
    String? updatedAt,
  }) =>
      Prescription(
        id: id ?? _id,
        appointmentId: appointmentId ?? _appointmentId,
        userId: userId ?? _userId,
        medicine: medicine ?? _medicine,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get appointmentId => _appointmentId;

  int? get userId => _userId;

  String? get medicine => _medicine;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['appointment_id'] = _appointmentId;
    map['user_id'] = _userId;
    map['medicine'] = _medicine;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Documents {
  Documents({
    int? id,
    int? appointmentId,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _appointmentId = appointmentId;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Documents.fromJson(dynamic json) {
    _id = json['id'];
    _appointmentId = json['appointment_id'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _appointmentId;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  Documents copyWith({
    int? id,
    int? appointmentId,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Documents(
        id: id ?? _id,
        appointmentId: appointmentId ?? _appointmentId,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get appointmentId => _appointmentId;

  String? get image => _image;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['appointment_id'] = _appointmentId;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Patient {
  Patient({
    int? id,
    int? userId,
    String? fullname,
    int? age,
    int? gender,
    String? relation,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _fullname = fullname;
    _age = age;
    _gender = gender;
    _relation = relation;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Patient.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _fullname = json['fullname'];
    _age = json['age'];
    _gender = json['gender'];
    _relation = json['relation'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _userId;
  String? _fullname;
  int? _age;
  int? _gender;
  String? _relation;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  Patient copyWith({
    int? id,
    int? userId,
    String? fullname,
    int? age,
    int? gender,
    String? relation,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Patient(
        id: id ?? _id,
        userId: userId ?? _userId,
        fullname: fullname ?? _fullname,
        age: age ?? _age,
        gender: gender ?? _gender,
        relation: relation ?? _relation,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  int? get userId => _userId;

  String? get fullname => _fullname;

  int? get age => _age;

  int? get gender => _gender;

  String? get relation => _relation;

  String? get image => _image;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['fullname'] = _fullname;
    map['age'] = _age;
    map['gender'] = _gender;
    map['relation'] = _relation;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
