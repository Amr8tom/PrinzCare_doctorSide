import 'dart:convert';

class Countries {
  Countries({
    List<Country>? country,
  }) {
    _country = country;
  }

  Countries.fromJson(dynamic json) {
    if (json['Country'] != null) {
      _country = [];
      json['Country'].forEach((v) {
        _country?.add(Country.fromJson(v));
      });
    }
  }

  List<Country>? _country;

  Countries copyWith({
    List<Country>? country,
  }) =>
      Countries(
        country: country ?? _country,
      );

  List<Country>? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_country != null) {
      map['Country'] = _country?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Country {
  Country({
    String? continentName,
    String? languageCode,
    String? countryCode,
    String? countryCodeWithName,
    String? countryName,
    String? continentCode,
    String? capitalName,
    String? currencyCode,
    String? phoneCode,
    String? threeLetterCountryCode,
  }) {
    _continentName = continentName;
    _languageCode = languageCode;
    _countryCode = countryCode;
    _countryCodeWithName = countryCodeWithName;
    _countryName = countryName;
    _continentCode = continentCode;
    _capitalName = capitalName;
    _currencyCode = currencyCode;
    _phoneCode = phoneCode;
    _threeLetterCountryCode = threeLetterCountryCode;
  }

  Country.fromJson(dynamic json) {
    _continentName = json['continent_name'];
    _languageCode = json['language_code'];
    _countryCode = json['country_code'];
    _countryCodeWithName = json['country_code_with_name'];
    _countryName = json['country_name'];
    _continentCode = json['continent_code'];
    _capitalName = json['capital_name'];
    _currencyCode = json['currency_code'];
    _phoneCode = json['phone_code'];
    _threeLetterCountryCode = json['three_letter_country_code'];
  }

  String? _continentName;
  String? _languageCode;
  String? _countryCode;
  String? _countryCodeWithName;
  String? _countryName;
  String? _continentCode;
  String? _capitalName;
  String? _currencyCode;
  String? _phoneCode;
  String? _threeLetterCountryCode;

  Country copyWith({
    String? continentName,
    String? languageCode,
    String? countryCode,
    String? countryCodeWithName,
    String? countryName,
    String? continentCode,
    String? capitalName,
    String? currencyCode,
    String? phoneCode,
    String? threeLetterCountryCode,
  }) =>
      Country(
        continentName: continentName ?? _continentName,
        languageCode: languageCode ?? _languageCode,
        countryCode: countryCode ?? _countryCode,
        countryCodeWithName: countryCodeWithName ?? _countryCodeWithName,
        countryName: countryName ?? _countryName,
        continentCode: continentCode ?? _continentCode,
        capitalName: capitalName ?? _capitalName,
        currencyCode: currencyCode ?? _currencyCode,
        phoneCode: phoneCode ?? _phoneCode,
        threeLetterCountryCode:
            threeLetterCountryCode ?? _threeLetterCountryCode,
      );

  String? get continentName => _continentName;

  String? get languageCode => _languageCode;

  String? get countryCode => _countryCode;

  String? get countryCodeWithName => _countryCodeWithName;

  String? get countryName => _countryName;

  String? get continentCode => _continentCode;

  String? get capitalName => _capitalName;

  String? get currencyCode => _currencyCode;

  String? get phoneCode => _phoneCode;

  String? get threeLetterCountryCode => _threeLetterCountryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['continent_name'] = _continentName;
    map['language_code'] = _languageCode;
    map['country_code'] = _countryCode;
    map['country_code_with_name'] = _countryCodeWithName;
    map['country_name'] = _countryName;
    map['continent_code'] = _continentCode;
    map['capital_name'] = _capitalName;
    map['currency_code'] = _currencyCode;
    map['phone_code'] = _phoneCode;
    map['three_letter_country_code'] = _threeLetterCountryCode;
    return map;
  }

  static String encode(List<Country> countries) => json.encode(
        countries
            .map<Map<String, dynamic>>((music) => Country().toJson())
            .toList(),
      );

  static List<Country> decode(String countries) =>
      (json.decode(countries) as List<dynamic>)
          .map<Country>((item) => Country.fromJson(item))
          .toList();
}
