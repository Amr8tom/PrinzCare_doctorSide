import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/model/custom/order_summary.dart';
import 'package:doctor_flutter/screen/accept_reject_screen/widget/mark_complete_sheet.dart';
import 'package:doctor_flutter/screen/appointment_chat_screen/appointment_chat_screen.dart';
import 'package:doctor_flutter/screen/medical_prescription_screen/medical_prescription_screen.dart';
import 'package:doctor_flutter/screen/message_chat_screen/widget/message_chat_top_bar.dart';
import 'package:doctor_flutter/screen/previous_appointment_screen/previous_appointment_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptRejectScreenController extends GetxController {
  TextEditingController diagnosedController = TextEditingController();
  TextEditingController completionOtpController = TextEditingController();
  bool isLoading = false;
  bool isDiagnosed = false;
  bool isCompletionOtp = false;
  AppointmentData? appointmentData;
  bool isExpanded = false;
  OrderSummary? orderSummary;

  @override
  void onInit() {
    fetchAppointmentDetailsApiCall();
    super.onInit();
  }

  void onExpandTap(bool value) {
    isExpanded = value;
    update();
  }

  void onAcceptBtnTap(AppointmentData? data) {
    CustomUi.loader();
    ApiService.instance
        .acceptAppointment(appointmentId: data?.id, doctorId: data?.doctorId)
        .then((value) {
      Get.back();
      if (value.status == true) {
        fetchAppointmentDetailsApiCall();
        CustomUi.snackBar(
            iconData: Icons.done_outline,
            message: value.message,
            positive: true);
      } else {
        CustomUi.snackBar(iconData: Icons.done_outline, message: value.message);
      }
    });
  }

  void fetchAppointmentDetailsApiCall() {
    if (Get.arguments is AppointmentData) {
      appointmentData = Get.arguments;
    }

    isLoading = true;
    ApiService.instance
        .fetchAppointmentDetails(appointmentId: appointmentData?.id)
        .then((value) {
      appointmentData = value.data;
      isLoading = false;
      update();
    });
  }

  void onDeclineBtnTap(AppointmentData? data) {
    Get.dialog(
      ConfirmationDialog(
        onPositiveBtn: () {
          Get.back();
          CustomUi.loader();
          ApiService.instance
              .declineAppointment(
                  appointmentId: data?.id, doctorId: data?.doctorId)
              .then((value) {
            Get.back();
            Get.back();
            if (value.status == true) {
              CustomUi.snackBar(
                  iconData: Icons.done_outline,
                  positive: true,
                  message: value.message);
            } else {
              CustomUi.snackBar(
                  iconData: Icons.done_outline, message: value.message);
            }
          });
        },
        title: S.current.areYouSure,
        title2: S.current.doYouWantToDeleteThisAppointment,
        positiveText: S.current.delete,
        aspectRatio: 1 / 0.65,
      ),
    );
  }

  void onMedicalPrescriptionTap() {
    Get.to(() => const MedicalPrescriptionScreen(), arguments: appointmentData)
        ?.then((value) {
      fetchAppointmentDetailsApiCall();
    });
  }

  void onMarkCompleteTap(AcceptRejectScreenController controller) {
    Get.bottomSheet(
            MarkCompleteSheet(
                onTap: completeAppointmentApiCall, controller: controller),
            isScrollControlled: true)
        .then((value) {
      diagnosedController.text = '';
      completionOtpController.text = '';
      isDiagnosed = false;
      isCompletionOtp = false;
      fetchAppointmentDetailsApiCall();
    });
  }

  void completeAppointmentApiCall() {
    isDiagnosed = false;
    isCompletionOtp = false;
    update();
    if (diagnosedController.text.isEmpty) {
      isDiagnosed = true;
      return;
    }
    if (completionOtpController.text.isEmpty) {
      isCompletionOtp = true;
      return;
    }
    ApiService.instance
        .completeAppointment(
            appointmentId: appointmentData?.id,
            doctorId: appointmentData?.doctorId,
            otp: completionOtpController.text,
            diagnoseWith: diagnosedController.text)
        .then(
      (value) {
        Get.back();
        if (value.status == true) {
          CustomUi.snackBar(
              iconData: Icons.done_outline_outlined,
              message: value.message,
              positive: true);
        } else {
          CustomUi.snackBar(
              iconData: Icons.done_outline_outlined, message: value.message);
        }
      },
    );
  }

  void onPreviousAppointmentTap() {
    Get.to(
      () => PreviousAppointmentScreen(
        appointmentData: appointmentData,
      ),
    );
  }

  void onMessageBtnTap() {
    Get.to(() => const AppointmentChatScreen(), arguments: appointmentData);
  }
}
