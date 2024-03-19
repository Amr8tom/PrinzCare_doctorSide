import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/screen/accept_reject_screen/accept_reject_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestScreenController extends GetxController {
  int? start = 0;
  bool isLoading = false;
  ScrollController requestController = ScrollController();

  List<AppointmentData> appointment = [];

  @override
  void onInit() {
    fetchAppointmentRequestApiCall();
    scrollToFetchData();
    super.onInit();
  }

  void fetchAppointmentRequestApiCall() {
    isLoading = true;
    ApiService.instance.fetchAppointmentRequests(start: start).then((value) {
      if (start == 0) {
        appointment = value.data ?? [];
      } else {
        appointment.addAll(value.data!);
      }
      start = appointment.length;
      isLoading = false;
      update();
    });
  }

  void scrollToFetchData() {
    if (requestController.hasClients) {
      requestController.addListener(
        () {
          if (requestController.offset ==
              requestController.position.maxScrollExtent) {
            if (!isLoading) {
              fetchAppointmentRequestApiCall();
            }
          }
        },
      );
    }
  }

  void onViewTap(AppointmentData? data) {
    Get.to(() => const AcceptRejectScreen(), arguments: data)?.then((value) {
      start = 0;
      fetchAppointmentRequestApiCall();
    });
  }
}
