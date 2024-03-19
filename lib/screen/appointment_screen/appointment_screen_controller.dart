import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/appointment_screen/widget/select_month_dialog.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentScreenController extends GetxController {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  List<AppointmentData>? acceptAppointment;
  List<AppointmentData>? filterAppointment;
  bool isLoading = false;
  PrefService prefService = PrefService();
  TextEditingController searchController = TextEditingController();

  DoctorData? doctorData;

  @override
  void onInit() {
    prefData();
    fetchAcceptedAppointsByDateApiCall(date: DateTime(year, month, day));
    super.onInit();
  }

  void onDoneClick(int month, int year) {
    CommonFun.doctorBanned(() {
      this.year = year;
      this.month = month;
      fetchAcceptedAppointsByDateApiCall(date: DateTime(year, month, day));
      update([kAppointmentDateChange]);
    });
  }

  void onSelectedDateClick(int year, int month, int day) async {
    CommonFun.doctorBanned(() {
      this.year = year;
      this.month = month;
      this.day = day;
      fetchAcceptedAppointsByDateApiCall(date: DateTime(year, month, day));
      update([kAppointmentDateChange]);
    });
  }

  void fetchAcceptedAppointsByDateApiCall({required DateTime date}) async {
    isLoading = true;
    ApiService.instance
        .fetchAcceptedAppointsByDate(
            date: DateFormat(yyyyMmDd, 'en').format(date))
        .then((value) {
      acceptAppointment = value.data;
      filterAppointment = value.data;
      isLoading = false;
      update();
    });
  }

  void onSearchChanged(String value) {
    if (searchController.text.isEmpty) {
      filterAppointment = acceptAppointment;
    } else {
      filterAppointment = acceptAppointment
          ?.where((element) => (element.user?.fullname ?? '')
              .isCaseInsensitiveContains(searchController.text))
          .toList();
    }
    update();
  }

  void prefData() async {
    await prefService.init();
    doctorData = prefService.getRegistrationData();
    update();
  }

  void onAppointmentBoxTap() {
    CommonFun.doctorBanned(() {
      showDialog(
        context: Get.context!,
        builder: (context) => SelectMonthDialog(
          onDoneClick: onDoneClick,
          month: month,
          year: year,
        ),
      );
    });
  }
}
