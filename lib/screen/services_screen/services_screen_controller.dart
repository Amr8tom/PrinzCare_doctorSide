import 'dart:developer';

import 'package:doctor_flutter/common/bottom_sheet_one_text_field.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesScreenController extends GetxController {
  TextEditingController serviceController = TextEditingController();
  DoctorData? registrationData;
  bool isLoading = false;

  @override
  void onInit() {
    doctorProfileApiCall();
    super.onInit();
  }

  void doctorProfileApiCall() async {
    isLoading = true;
    ApiService.instance.fetchMyDoctorProfile().then((value) {
      registrationData = value.data;
      isLoading = false;
      update();
    });
  }

  void onAddBtnTap({int? apiType, int? id, required int screenType}) async {
    log(serviceController.text);
    if (serviceController.text.isEmpty) {
      CustomUi.snackBar(
          message: apiType == 1
              ? S.current.pleaseAddServices
              : S.current.pleaseEditServices,
          iconData: Icons.home_repair_service_rounded);
      return;
    }
    CustomUi.loader();
    if (screenType == 0) {
      await ApiService.instance
          .addEditService(
              apiType: apiType, title: serviceController.text, serviceId: id)
          .then(
        (value) {
          Get.back();
          if (Get.isBottomSheetOpen == true) {
            Get.back();
          }
          if (value.status == true) {
            registrationData = value.data;
            CustomUi.snackBar(
                iconData: Icons.medical_services,
                message: value.message,
                positive: true);
            update();
          } else {
            CustomUi.snackBar(
                iconData: Icons.medical_services, message: value.message);
          }
        },
      );
    } else if (screenType == 1) {
      await ApiService.instance
          .addEditExpertise(
              apiType: apiType, title: serviceController.text, expertiseId: id)
          .then((value) {
        if (Get.isBottomSheetOpen == true) {
          Get.back();
        }
        Get.back();
        if (value.status == true) {
          registrationData = value.data;
          CustomUi.snackBar(
              iconData: Icons.medical_services,
              message: value.message,
              positive: true);
          update();
        } else {
          CustomUi.snackBar(
              iconData: Icons.medical_services,
              message: value.message,
              positive: true);
        }
      });
    } else if (screenType == 2) {
      await ApiService.instance
          .addEditExperience(
              apiType: apiType, title: serviceController.text, experienceId: id)
          .then((value) {
        if (Get.isBottomSheetOpen == true) {
          Get.back();
        }
        Get.back();
        if (value.status == true) {
          registrationData = value.data;
          CustomUi.snackBar(
              iconData: Icons.medical_services,
              message: value.message,
              positive: true);
          update();
        } else {
          CustomUi.snackBar(
              iconData: Icons.medical_services,
              message: value.message,
              positive: true);
        }
      });
    } else if (screenType == 3) {
      await ApiService.instance
          .addEditAwards(
              apiType: apiType, title: serviceController.text, awardId: id)
          .then((value) {
        if (Get.isBottomSheetOpen == true) {
          Get.back();
        }
        Get.back();
        if (value.status == true) {
          registrationData = value.data;
          CustomUi.snackBar(
              iconData: Icons.medical_services,
              message: value.message,
              positive: true);
          update();
        } else {
          CustomUi.snackBar(
              iconData: Icons.medical_services,
              message: value.message,
              positive: true);
        }
      });
    }
  }

  void onServiceSheetOpen(
      {required int screenType, int? apiType, int? id, required bool isAdd}) {
    Get.bottomSheet(
            BottomSheetOneTextField(
                onTap: () => onAddBtnTap(
                    apiType: apiType, id: id, screenType: screenType),
                title:
                    "${isAdd ? S.current.add : S.current.edit} ${screenType == 0 ? S.current.services : screenType == 1 ? S.current.expertise : screenType == 2 ? S.current.experience : screenType == 3 ? S.current.awards : S.current.awards}",
                controller: serviceController),
            isScrollControlled: true)
        .then((value) {
      serviceController.clear();
    });
  }
}
