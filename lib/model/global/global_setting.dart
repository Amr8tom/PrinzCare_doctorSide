class GlobalSetting {
  GlobalSetting({
    bool? status,
    String? message,
    GlobalSettingData? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  GlobalSetting.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data =
        json['data'] != null ? GlobalSettingData.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  GlobalSettingData? _data;

  bool? get status => _status;
  String? get message => _message;
  GlobalSettingData? get data => _data;

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

class GlobalSettingData {
  GlobalSettingData({
    num? id,
    String? currency,
    num? comission,
    num? minAmountPayoutDoctor,
    num? maxOrderAtOnce,
    String? supportEmail,
    num? paymentGateway,
    String? stripePublishableKey,
    String? stripeSecret,
    String? stripeCurrencyCode,
    String? razorpayKey,
    String? razorpayCurrencyCode,
    String? paystackPublicKey,
    String? paystackSecretKey,
    String? paystackCurrencyCode,
    String? paypalClientId,
    String? paypalSecretKey,
    String? paypalCurrencyCode,
    String? flutterwavePublicKey,
    String? flutterwaveSecretKey,
    String? flutterwaveEncryptionKey,
    String? flutterwaveCurrencyCode,
    String? createdAt,
    String? updatedAt,
    List<Taxes>? taxes,
  }) {
    _id = id;
    _currency = currency;
    _comission = comission;
    _minAmountPayoutDoctor = minAmountPayoutDoctor;
    _maxOrderAtOnce = maxOrderAtOnce;
    _supportEmail = supportEmail;
    _paymentGateway = paymentGateway;
    _stripePublishableKey = stripePublishableKey;
    _stripeSecret = stripeSecret;
    _stripeCurrencyCode = stripeCurrencyCode;
    _razorpayKey = razorpayKey;
    _razorpayCurrencyCode = razorpayCurrencyCode;
    _paystackPublicKey = paystackPublicKey;
    _paystackSecretKey = paystackSecretKey;
    _paystackCurrencyCode = paystackCurrencyCode;
    _paypalClientId = paypalClientId;
    _paypalSecretKey = paypalSecretKey;
    _paypalCurrencyCode = paypalCurrencyCode;
    _flutterwavePublicKey = flutterwavePublicKey;
    _flutterwaveSecretKey = flutterwaveSecretKey;
    _flutterwaveEncryptionKey = flutterwaveEncryptionKey;
    _flutterwaveCurrencyCode = flutterwaveCurrencyCode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _taxes = taxes;
  }

  GlobalSettingData.fromJson(dynamic json) {
    _id = json['id'];
    _currency = json['currency'];
    _comission = json['comission'];
    _minAmountPayoutDoctor = json['min_amount_payout_doctor'];
    _maxOrderAtOnce = json['max_order_at_once'];
    _supportEmail = json['support_email'];
    _paymentGateway = json['payment_gateway'];
    _stripePublishableKey = json['stripe_publishable_key'];
    _stripeSecret = json['stripe_secret'];
    _stripeCurrencyCode = json['stripe_currency_code'];
    _razorpayKey = json['razorpay_key'];
    _razorpayCurrencyCode = json['razorpay_currency_code'];
    _paystackPublicKey = json['paystack_public_key'];
    _paystackSecretKey = json['paystack_secret_key'];
    _paystackCurrencyCode = json['paystack_currency_code'];
    _paypalClientId = json['paypal_client_id'];
    _paypalSecretKey = json['paypal_secret_key'];
    _paypalCurrencyCode = json['paypal_currency_code'];
    _flutterwavePublicKey = json['flutterwave_public_key'];
    _flutterwaveSecretKey = json['flutterwave_secret_key'];
    _flutterwaveEncryptionKey = json['flutterwave_encryption_key'];
    _flutterwaveCurrencyCode = json['flutterwave_currency_code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['taxes'] != null) {
      _taxes = [];
      json['taxes'].forEach((v) {
        _taxes?.add(Taxes.fromJson(v));
      });
    }
  }

  num? _id;
  String? _currency;
  num? _comission;
  num? _minAmountPayoutDoctor;
  num? _maxOrderAtOnce;
  String? _supportEmail;
  num? _paymentGateway;
  String? _stripePublishableKey;
  String? _stripeSecret;
  String? _stripeCurrencyCode;
  String? _razorpayKey;
  String? _razorpayCurrencyCode;
  String? _paystackPublicKey;
  String? _paystackSecretKey;
  String? _paystackCurrencyCode;
  String? _paypalClientId;
  String? _paypalSecretKey;
  String? _paypalCurrencyCode;
  String? _flutterwavePublicKey;
  String? _flutterwaveSecretKey;
  String? _flutterwaveEncryptionKey;
  String? _flutterwaveCurrencyCode;
  String? _createdAt;
  String? _updatedAt;
  List<Taxes>? _taxes;

  num? get id => _id;
  String? get currency => _currency;
  num? get comission => _comission;
  num? get minAmountPayoutDoctor => _minAmountPayoutDoctor;

  num? get maxOrderAtOnce => _maxOrderAtOnce;

  String? get supportEmail => _supportEmail;

  num? get paymentGateway => _paymentGateway;
  String? get stripePublishableKey => _stripePublishableKey;
  String? get stripeSecret => _stripeSecret;
  String? get stripeCurrencyCode => _stripeCurrencyCode;
  String? get razorpayKey => _razorpayKey;
  String? get razorpayCurrencyCode => _razorpayCurrencyCode;
  String? get paystackPublicKey => _paystackPublicKey;
  String? get paystackSecretKey => _paystackSecretKey;
  String? get paystackCurrencyCode => _paystackCurrencyCode;
  String? get paypalClientId => _paypalClientId;
  String? get paypalSecretKey => _paypalSecretKey;
  String? get paypalCurrencyCode => _paypalCurrencyCode;
  String? get flutterwavePublicKey => _flutterwavePublicKey;
  String? get flutterwaveSecretKey => _flutterwaveSecretKey;
  String? get flutterwaveEncryptionKey => _flutterwaveEncryptionKey;
  String? get flutterwaveCurrencyCode => _flutterwaveCurrencyCode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Taxes>? get taxes => _taxes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['currency'] = _currency;
    map['comission'] = _comission;
    map['min_amount_payout_doctor'] = _minAmountPayoutDoctor;
    map['max_order_at_once'] = _maxOrderAtOnce;
    map['support_email'] = _supportEmail;
    map['payment_gateway'] = _paymentGateway;
    map['stripe_publishable_key'] = _stripePublishableKey;
    map['stripe_secret'] = _stripeSecret;
    map['stripe_currency_code'] = _stripeCurrencyCode;
    map['razorpay_key'] = _razorpayKey;
    map['razorpay_currency_code'] = _razorpayCurrencyCode;
    map['paystack_public_key'] = _paystackPublicKey;
    map['paystack_secret_key'] = _paystackSecretKey;
    map['paystack_currency_code'] = _paystackCurrencyCode;
    map['paypal_client_id'] = _paypalClientId;
    map['paypal_secret_key'] = _paypalSecretKey;
    map['paypal_currency_code'] = _paypalCurrencyCode;
    map['flutterwave_public_key'] = _flutterwavePublicKey;
    map['flutterwave_secret_key'] = _flutterwaveSecretKey;
    map['flutterwave_encryption_key'] = _flutterwaveEncryptionKey;
    map['flutterwave_currency_code'] = _flutterwaveCurrencyCode;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_taxes != null) {
      map['taxes'] = _taxes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Taxes {
  Taxes({
    num? id,
    num? status,
    String? taxTitle,
    num? type,
    num? value,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _status = status;
    _taxTitle = taxTitle;
    _type = type;
    _value = value;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Taxes.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _taxTitle = json['tax_title'];
    _type = json['type'];
    _value = json['value'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  num? _status;
  String? _taxTitle;
  num? _type;
  num? _value;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;

  num? get status => _status;

  String? get taxTitle => _taxTitle;

  num? get type => _type;

  num? get value => _value;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['tax_title'] = _taxTitle;
    map['type'] = _type;
    map['value'] = _value;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
