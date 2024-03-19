import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:intl/intl.dart';

extension A on int {
  String get number {
    return NumberFormat.compactCurrency(
            decimalDigits: 0, locale: 'en_US', name: '')
        .format(this)
        .toString();
  }
}

extension B on num {
  int get genderParse {
    return int.parse('$this');
  }
}

extension C on String {

  String dateMilliFormat(String formatKey) {
    return DateFormat(formatKey, 'en')
        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(this)).toLocal());
  }

  String dateParse(String formatKey) {
    return DateFormat(formatKey, 'en').format(DateTime.parse(this).toLocal());
  }

  String get appointmentDate {
    return dateParse(eeeMmmDdYyyy);
  }

  String get appointmentTime {
    return CommonFun.convert24HoursInto12Hours(this);
  }
}
