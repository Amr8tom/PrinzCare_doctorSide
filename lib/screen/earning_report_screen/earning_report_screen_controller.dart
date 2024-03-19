import 'package:collection/collection.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/model/wallet/earning_history.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EarningReportScreenController extends GetxController {
  List<SalesData> chartData = [];

  Map<String, dynamic>? data;
  num thisMonthEarning = 0;
  int year = DateTime.now().year;
  int month = DateTime.now().month;

  List<EarningHistoryData>? earningData;
  PrefService prefService = PrefService();
  DoctorData? doctorData;

  @override
  void onInit() {
    prefData();
    fetchEarningReport(year: year, month: month);
    super.onInit();
  }

  void fetchEarningReport({required int year, required int month}) async {
    await ApiService.instance
        .fetchDoctorEarningHistory(
            month: DateFormat(mm, 'en').format(DateTime(year, month)),
            year: DateFormat(yyyy, 'en').format(DateTime(year)))
        .then((value) {
      chartData = [];
      thisMonthEarning = 0;
      var dates = days(year, month);
      earningData = value.data;
      Map<String, List<EarningHistoryData>>? groupData =
          groupBy<EarningHistoryData, String>(earningData?.toList() ?? [],
              (p0) => p0.createdAt?.substring(0, 10) ?? '');
      Map<int, num> finalMap = {};
      groupData.forEach((key, value) {
        var date = DateTime.parse(key).day;
        var amounts = value
            .map((e) => e.amount ?? 0)
            .toList()
            .reduce((value, element) => value + element);
        var map = {date: amounts};
        thisMonthEarning = thisMonthEarning + amounts;
        finalMap.addAll(map);
      });

      for (int i = 1; i <= dates; i++) {
        if (finalMap.containsKey(i)) {
          chartData.add(SalesData(x: i, y: finalMap[i]?.toDouble()));
        } else {
          chartData.add(SalesData(x: i, y: 0));
        }
      }
      update();
    });
  }

  int days(int year, int month) {
    var date = DateTime(year, month, 01);
    int daysInMonth =
        DateTimeRange(start: date, end: DateTime(date.year, date.month + 1))
            .duration
            .inDays;
    return daysInMonth;
  }

  void onDoneClick(int month, int year) {
    this.month = month;
    this.year = year;
    fetchEarningReport(year: year, month: month);
  }

  void prefData() async {
    await prefService.init();
    doctorData = prefService.getRegistrationData();
    update();
  }
}

class SalesData {
  SalesData({this.x, this.y});

  final int? x;
  final double? y;
}
