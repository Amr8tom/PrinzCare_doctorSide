class Registration {
  Registration({
    bool? status,
    String? message,
    DoctorData? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  Registration.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? DoctorData.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  DoctorData? _data;

  Registration copyWith({
    bool? status,
    String? message,
    DoctorData? data,
  }) =>
      Registration(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get status => _status;

  String? get message => _message;

  DoctorData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class DoctorData {
  DoctorData({
    int? id,
    String? identity,
    int? status,
    double? rating,
    int? onVacation,
    String? doctorNumber,
    String? name,
    String? image,
    String? countryCode,
    String? mobileNumber,
    String? deviceToken,
    int? gender,
    int? categoryId,
    String? designation,
    String? degrees,
    String? languagesSpoken,
    int? experienceYear,
    int? consultationFee,
    String? aboutYouself,
    String? educationalJourney,
    int? onlineConsultation,
    int? clinicConsultation,
    String? clinicName,
    String? clinicAddress,
    String? clinicLat,
    String? clinicLong,
    int? isNotification,
    int? totalPatientsCured,
    num? wallet,
    num? lifetimeEarnings,
    String? createdAt,
    String? updatedAt,
    List<Services>? services,
    List<Services>? experience,
    List<Services>? expertise,
    List<ServiceLocations>? serviceLocations,
    List<Services>? awards,
    List<Slots>? slots,
    List<Holidays>? holidays,
    BankAccount? bankAccount,
  }) {
    _id = id;
    _identity = identity;
    _status = status;
    _rating = rating;
    _onVacation = onVacation;
    _doctorNumber = doctorNumber;
    _name = name;
    _image = image;
    _countryCode = countryCode;
    _mobileNumber = mobileNumber;
    _deviceToken = deviceToken;
    _gender = gender;
    _categoryId = categoryId;
    _designation = designation;
    _degrees = degrees;
    _languagesSpoken = languagesSpoken;
    _experienceYear = experienceYear;
    _consultationFee = consultationFee;
    _aboutYouself = aboutYouself;
    _educationalJourney = educationalJourney;
    _onlineConsultation = onlineConsultation;
    _clinicConsultation = clinicConsultation;
    _clinicName = clinicName;
    _clinicAddress = clinicAddress;
    _clinicLat = clinicLat;
    _clinicLong = clinicLong;
    _isNotification = isNotification;
    _totalPatientsCured = totalPatientsCured;
    _wallet = wallet;
    _lifetimeEarnings = lifetimeEarnings;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _services = services;
    _experience = experience;
    _expertise = expertise;
    _serviceLocations = serviceLocations;
    _awards = awards;
    _slots = slots;
    _holidays = holidays;
    _bankAccount = bankAccount;
  }

  DoctorData.fromJson(dynamic json) {
    _id = json['id'];
    _identity = json['identity'];
    _status = json['status'];
    _rating = json['rating'].toDouble();
    _onVacation = json['on_vacation'];
    _doctorNumber = json['doctor_number'];
    _name = json['name'];
    _image = json['image'];
    _countryCode = json['country_code'];
    _mobileNumber = json['mobile_number'];
    _deviceToken = json['device_token'];
    _gender = json['gender'];
    _categoryId = json['category_id'];
    _designation = json['designation'];
    _degrees = json['degrees'];
    _languagesSpoken = json['languages_spoken'];
    _experienceYear = json['experience_year'];
    _consultationFee = json['consultation_fee'];
    _aboutYouself = json['about_youself'];
    _educationalJourney = json['educational_journey'];
    _onlineConsultation = json['online_consultation'];
    _clinicConsultation = json['clinic_consultation'];
    _clinicName = json['clinic_name'];
    _clinicAddress = json['clinic_address'];
    _clinicLat = json['clinic_lat'];
    _clinicLong = json['clinic_long'];
    _isNotification = json['is_notification'];
    _totalPatientsCured = json['total_patients_cured'];
    _wallet = json['wallet'];
    _lifetimeEarnings = json['lifetime_earnings'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
    if (json['experience'] != null) {
      _experience = [];
      json['experience'].forEach((v) {
        _experience?.add(Services.fromJson(v));
      });
    }
    if (json['expertise'] != null) {
      _expertise = [];
      json['expertise'].forEach((v) {
        _expertise?.add(Services.fromJson(v));
      });
    }
    if (json['service_locations'] != null) {
      _serviceLocations = [];
      json['service_locations'].forEach((v) {
        _serviceLocations?.add(ServiceLocations.fromJson(v));
      });
    }
    if (json['awards'] != null) {
      _awards = [];
      json['awards'].forEach((v) {
        _awards?.add(Services.fromJson(v));
      });
    }
    if (json['slots'] != null) {
      _slots = [];
      json['slots'].forEach((v) {
        _slots?.add(Slots.fromJson(v));
      });
    }
    if (json['holidays'] != null) {
      _holidays = [];
      json['holidays'].forEach((v) {
        _holidays?.add(Holidays.fromJson(v));
      });
    }
    _bankAccount = json['bank_account'] != null
        ? BankAccount.fromJson(json['bank_account'])
        : null;
  }

  int? _id;
  String? _identity;
  int? _status;
  double? _rating;
  int? _onVacation;
  String? _doctorNumber;
  String? _name;
  String? _image;
  String? _countryCode;
  String? _mobileNumber;
  String? _deviceToken;
  int? _gender;
  int? _categoryId;
  String? _designation;
  String? _degrees;
  String? _languagesSpoken;
  int? _experienceYear;
  int? _consultationFee;
  String? _aboutYouself;
  String? _educationalJourney;
  int? _onlineConsultation;
  int? _clinicConsultation;
  String? _clinicName;
  String? _clinicAddress;
  String? _clinicLat;
  String? _clinicLong;
  int? _isNotification;
  int? _totalPatientsCured;
  num? _wallet;
  num? _lifetimeEarnings;
  String? _createdAt;
  String? _updatedAt;
  List<Services>? _services;
  List<Services>? _experience;
  List<Services>? _expertise;
  List<ServiceLocations>? _serviceLocations;
  List<Services>? _awards;
  List<Slots>? _slots;
  List<Holidays>? _holidays;
  BankAccount? _bankAccount;

  DoctorData copyWith({
    int? id,
    String? identity,
    int? status,
    double? rating,
    int? onVacation,
    String? doctorNumber,
    String? name,
    String? image,
    String? countryCode,
    String? mobileNumber,
    String? deviceToken,
    int? gender,
    int? categoryId,
    String? designation,
    String? degrees,
    String? languagesSpoken,
    int? experienceYear,
    int? consultationFee,
    String? aboutYouself,
    String? educationalJourney,
    int? onlineConsultation,
    int? clinicConsultation,
    String? clinicName,
    String? clinicAddress,
    String? clinicLat,
    String? clinicLong,
    int? isNotification,
    int? totalPatientsCured,
    num? wallet,
    num? lifetimeEarnings,
    String? createdAt,
    String? updatedAt,
    List<Services>? services,
    List<Services>? experience,
    List<Services>? expertise,
    List<ServiceLocations>? serviceLocations,
    List<Services>? awards,
    List<Slots>? slots,
    List<Holidays>? holidays,
    BankAccount? bankAccount,
  }) =>
      DoctorData(
        id: id ?? _id,
        identity: identity ?? _identity,
        status: status ?? _status,
        rating: rating ?? _rating,
        onVacation: onVacation ?? _onVacation,
        doctorNumber: doctorNumber ?? _doctorNumber,
        name: name ?? _name,
        image: image ?? _image,
        countryCode: countryCode ?? _countryCode,
        mobileNumber: mobileNumber ?? _mobileNumber,
        deviceToken: deviceToken ?? _deviceToken,
        gender: gender ?? _gender,
        categoryId: categoryId ?? _categoryId,
        designation: designation ?? _designation,
        degrees: degrees ?? _degrees,
        languagesSpoken: languagesSpoken ?? _languagesSpoken,
        experienceYear: experienceYear ?? _experienceYear,
        consultationFee: consultationFee ?? _consultationFee,
        aboutYouself: aboutYouself ?? _aboutYouself,
        educationalJourney: educationalJourney ?? _educationalJourney,
        onlineConsultation: onlineConsultation ?? _onlineConsultation,
        clinicConsultation: clinicConsultation ?? _clinicConsultation,
        clinicName: clinicName ?? _clinicName,
        clinicAddress: clinicAddress ?? _clinicAddress,
        clinicLat: clinicLat ?? _clinicLat,
        clinicLong: clinicLong ?? _clinicLong,
        isNotification: isNotification ?? _isNotification,
        totalPatientsCured: totalPatientsCured ?? _totalPatientsCured,
        wallet: wallet ?? _wallet,
        lifetimeEarnings: lifetimeEarnings ?? _lifetimeEarnings,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        services: services ?? _services,
        experience: experience ?? _experience,
        expertise: expertise ?? _expertise,
        serviceLocations: serviceLocations ?? _serviceLocations,
        awards: awards ?? _awards,
        slots: slots ?? _slots,
        holidays: holidays ?? _holidays,
        bankAccount: bankAccount ?? _bankAccount,
      );

  int? get id => _id;

  String? get identity => _identity;

  int? get status => _status;

  double? get rating => _rating;

  int? get onVacation => _onVacation;

  String? get doctorNumber => _doctorNumber;

  String? get name => _name;

  String? get image => _image;

  String? get countryCode => _countryCode;

  String? get mobileNumber => _mobileNumber;

  String? get deviceToken => _deviceToken;

  int? get gender => _gender;
  int? get categoryId => _categoryId;
  String? get designation => _designation;

  String? get degrees => _degrees;

  String? get languagesSpoken => _languagesSpoken;

  int? get experienceYear => _experienceYear;

  int? get consultationFee => _consultationFee;

  String? get aboutYouself => _aboutYouself;

  String? get educationalJourney => _educationalJourney;

  int? get onlineConsultation => _onlineConsultation;

  int? get clinicConsultation => _clinicConsultation;

  String? get clinicName => _clinicName;

  String? get clinicAddress => _clinicAddress;

  String? get clinicLat => _clinicLat;

  String? get clinicLong => _clinicLong;

  int? get isNotification => _isNotification;

  int? get totalPatientsCured => _totalPatientsCured;

  num? get wallet => _wallet;

  num? get lifetimeEarnings => _lifetimeEarnings;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<Services>? get services => _services;

  List<Services>? get experience => _experience;

  List<Services>? get expertise => _expertise;

  List<ServiceLocations>? get serviceLocations => _serviceLocations;

  List<Services>? get awards => _awards;

  List<Slots>? get slots => _slots;

  List<Holidays>? get holidays => _holidays;

  BankAccount? get bankAccount => _bankAccount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['identity'] = _identity;
    map['status'] = _status;
    map['rating'] = _rating;
    map['on_vacation'] = _onVacation;
    map['doctor_number'] = _doctorNumber;
    map['name'] = _name;
    map['image'] = _image;
    map['country_code'] = _countryCode;
    map['mobile_number'] = _mobileNumber;
    map['device_token'] = _deviceToken;
    map['gender'] = _gender;
    map['category_id'] = _categoryId;
    map['designation'] = _designation;
    map['degrees'] = _degrees;
    map['languages_spoken'] = _languagesSpoken;
    map['experience_year'] = _experienceYear;
    map['consultation_fee'] = _consultationFee;
    map['about_youself'] = _aboutYouself;
    map['educational_journey'] = _educationalJourney;
    map['online_consultation'] = _onlineConsultation;
    map['clinic_consultation'] = _clinicConsultation;
    map['clinic_name'] = _clinicName;
    map['clinic_address'] = _clinicAddress;
    map['clinic_lat'] = _clinicLat;
    map['clinic_long'] = _clinicLong;
    map['is_notification'] = _isNotification;
    map['total_patients_cured'] = _totalPatientsCured;
    map['wallet'] = _wallet;
    map['lifetime_earnings'] = _lifetimeEarnings;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    if (_experience != null) {
      map['experience'] = _experience?.map((v) => v.toJson()).toList();
    }
    if (_expertise != null) {
      map['expertise'] = _expertise?.map((v) => v.toJson()).toList();
    }
    if (_serviceLocations != null) {
      map['service_locations'] =
          _serviceLocations?.map((v) => v.toJson()).toList();
    }
    if (_awards != null) {
      map['awards'] = _awards?.map((v) => v.toJson()).toList();
    }
    if (_slots != null) {
      map['slots'] = _slots?.map((v) => v.toJson()).toList();
    }
    if (_holidays != null) {
      map['holidays'] = _holidays?.map((v) => v.toJson()).toList();
    }
    if (_bankAccount != null) {
      map['bank_account'] = _bankAccount?.toJson();
    }
    return map;
  }
}

class BankAccount {
  BankAccount({
    int? id,
    int? doctorId,
    String? bankName,
    String? accountNumber,
    String? holder,
    String? swiftCode,
    String? chequePhoto,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _doctorId = doctorId;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _holder = holder;
    _swiftCode = swiftCode;
    _chequePhoto = chequePhoto;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  BankAccount.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _bankName = json['bank_name'];
    _accountNumber = json['account_number'];
    _holder = json['holder'];
    _swiftCode = json['swift_code'];
    _chequePhoto = json['cheque_photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _doctorId;
  String? _bankName;
  String? _accountNumber;
  String? _holder;
  String? _swiftCode;
  String? _chequePhoto;
  String? _createdAt;
  String? _updatedAt;
  BankAccount copyWith({
    int? id,
    int? doctorId,
    String? bankName,
    String? accountNumber,
    String? holder,
    String? swiftCode,
    String? chequePhoto,
    String? createdAt,
    String? updatedAt,
  }) =>
      BankAccount(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        bankName: bankName ?? _bankName,
        accountNumber: accountNumber ?? _accountNumber,
        holder: holder ?? _holder,
        swiftCode: swiftCode ?? _swiftCode,
        chequePhoto: chequePhoto ?? _chequePhoto,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  int? get doctorId => _doctorId;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get holder => _holder;
  String? get swiftCode => _swiftCode;
  String? get chequePhoto => _chequePhoto;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['bank_name'] = _bankName;
    map['account_number'] = _accountNumber;
    map['holder'] = _holder;
    map['swift_code'] = _swiftCode;
    map['cheque_photo'] = _chequePhoto;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Holidays {
  Holidays({
    int? id,
    int? doctorId,
    String? date,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _doctorId = doctorId;
    _date = date;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Holidays.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _date = json['date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _doctorId;
  String? _date;
  String? _createdAt;
  String? _updatedAt;
  Holidays copyWith({
    int? id,
    int? doctorId,
    String? date,
    String? createdAt,
    String? updatedAt,
  }) =>
      Holidays(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        date: date ?? _date,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  int? get doctorId => _doctorId;
  String? get date => _date;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['date'] = _date;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Slots {
  Slots({
    int? id,
    int? doctorId,
    String? time,
    int? weekday,
    int? bookingLimit,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _doctorId = doctorId;
    _time = time;
    _weekday = weekday;
    _bookingLimit = bookingLimit;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Slots.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _time = json['time'];
    _weekday = json['weekday'];
    _bookingLimit = json['booking_limit'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _doctorId;
  String? _time;
  int? _weekday;
  int? _bookingLimit;
  String? _createdAt;
  String? _updatedAt;

  Slots copyWith({
    int? id,
    int? doctorId,
    String? time,
    int? weekday,
    int? bookingLimit,
    String? createdAt,
    String? updatedAt,
  }) =>
      Slots(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        time: time ?? _time,
        weekday: weekday ?? _weekday,
        bookingLimit: bookingLimit ?? _bookingLimit,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  int? get doctorId => _doctorId;
  String? get time => _time;

  int? get weekday => _weekday;

  int? get bookingLimit => _bookingLimit;

  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['time'] = _time;
    map['weekday'] = _weekday;
    map['booking_limit'] = _bookingLimit;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Services {
  Services({
    int? id,
    int? doctorId,
    String? title,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _doctorId = doctorId;
    _title = title;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Services.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _title = json['title'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _doctorId;
  String? _title;
  String? _createdAt;
  String? _updatedAt;
  Services copyWith({
    int? id,
    int? doctorId,
    String? title,
    String? createdAt,
    String? updatedAt,
  }) =>
      Services(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        title: title ?? _title,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  int? get doctorId => _doctorId;
  String? get title => _title;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['title'] = _title;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class ServiceLocations {
  ServiceLocations({
    int? id,
    int? doctorId,
    String? hospitalTitle,
    String? hospitalAddress,
    String? hospitalLat,
    String? hospitalLong,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _doctorId = doctorId;
    _hospitalTitle = hospitalTitle;
    _hospitalAddress = hospitalAddress;
    _hospitalLat = hospitalLat;
    _hospitalLong = hospitalLong;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ServiceLocations.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _hospitalTitle = json['hospital_title'];
    _hospitalAddress = json['hospital_address'];
    _hospitalLat = json['hospital_lat'];
    _hospitalLong = json['hospital_long'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _doctorId;
  String? _hospitalTitle;
  String? _hospitalAddress;
  String? _hospitalLat;
  String? _hospitalLong;
  String? _createdAt;
  String? _updatedAt;
  ServiceLocations copyWith({
    int? id,
    int? doctorId,
    String? hospitalTitle,
    String? hospitalAddress,
    String? hospitalLat,
    String? hospitalLong,
    String? createdAt,
    String? updatedAt,
  }) =>
      ServiceLocations(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        hospitalTitle: hospitalTitle ?? _hospitalTitle,
        hospitalAddress: hospitalAddress ?? _hospitalAddress,
        hospitalLat: hospitalLat ?? _hospitalLat,
        hospitalLong: hospitalLong ?? _hospitalLong,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  int? get doctorId => _doctorId;
  String? get hospitalTitle => _hospitalTitle;
  String? get hospitalAddress => _hospitalAddress;
  String? get hospitalLat => _hospitalLat;
  String? get hospitalLong => _hospitalLong;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['hospital_title'] = _hospitalTitle;
    map['hospital_address'] = _hospitalAddress;
    map['hospital_lat'] = _hospitalLat;
    map['hospital_long'] = _hospitalLong;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
