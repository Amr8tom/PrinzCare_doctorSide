import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_three/doctor_profile_screeen_three.dart';
import 'package:doctor_flutter/screen/registration_successful_screen.dart/registration_successful_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfileScreenTwoController extends GetxController {
  TextEditingController aboutController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  PrefService prefService = PrefService();
  DoctorData? userData;
  FocusNode aboutFocusNode = FocusNode();
  FocusNode educationFocusNode = FocusNode();

  @override
  void onInit() {
    prefData();
    super.onInit();
  }

  void onAboutChange(String value) {
    update();
  }

  void onEducationChange(String value) {
    update();
  }

  void unFocusFiled() {
    aboutFocusNode.unfocus();
    educationFocusNode.unfocus();
  }

  void updateDoctorDetailsApiCall() {
    if (aboutController.text.isEmpty) {
      CustomUi.infoSnackBar(S.current.pleaseEnterAboutYourSelf);
      return;
    }
    if (educationController.text.isEmpty) {
      CustomUi.infoSnackBar(S.current.pleaseEnterEducationYourSelf);
      return;
    }
    unFocusFiled();
    CustomUi.loader();
    ApiService.instance
        .updateDoctorDetails(
            aboutYourself: aboutController.text,
            educationalJourney: educationController.text)
        .then((value) {
      if (value.status == true) {
        Get.back();
        if (Get.arguments == null) {
          navigateRoot();
        }
        CustomUi.snackBar(
            iconData: Icons.person, message: value.message, positive: true);
      } else {
        Get.back();
        CustomUi.snackBar(iconData: Icons.person, message: value.message);
      }
    });
  }

  void navigateRoot() {
    if (userData?.onlineConsultation == 0 &&
        userData?.clinicConsultation == 0) {
      Get.off(() => const DoctorProfileScreenThree());
    } else {
      Get.offAll(() => const RegistrationSuccessfulScreen());
    }
  }

  void prefData() async {
    await prefService.init();
    userData = prefService.getRegistrationData();
    aboutController = TextEditingController(text: userData?.aboutYouself ?? '');
    educationController =
        TextEditingController(text: userData?.educationalJourney ?? '');
    update();
  }
}
