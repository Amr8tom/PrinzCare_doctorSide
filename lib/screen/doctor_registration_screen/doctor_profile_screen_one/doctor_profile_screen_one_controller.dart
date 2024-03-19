import 'dart:developer';
import 'dart:io';

import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_three/doctor_profile_screeen_three.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_two/doctor_profile_screen_two.dart';
import 'package:doctor_flutter/screen/registration_successful_screen.dart/registration_successful_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DoctorProfileScreenOneController extends GetxController {
  TextEditingController designationController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  FocusNode designationFocusNode = FocusNode();
  FocusNode degreeFocusNode = FocusNode();
  FocusNode languageFocusNode = FocusNode();
  FocusNode experienceFocusNode = FocusNode();
  FocusNode feesFocusNode = FocusNode();

  final PrefService _prefService = PrefService();
  DoctorData? userData;
  String? netWorkProfileImage;
  File? profileImage;

  @override
  void onInit() {
    prefData();
    super.onInit();
  }

  void onDesignationChange(String value) {
    update();
  }

  void onDegreeChange(String value) {
    update();
  }

  void unFocusFiled() {
    designationFocusNode.unfocus();
    degreeFocusNode.unfocus();
    languageFocusNode.unfocus();
    experienceFocusNode.unfocus();
    feesFocusNode.unfocus();
  }

  void prefData() async {
    await _prefService.init();
    userData = _prefService.getRegistrationData();
    designationController =
        TextEditingController(text: userData?.designation ?? '');
    degreeController = TextEditingController(text: userData?.degrees ?? '');
    languageController =
        TextEditingController(text: userData?.languagesSpoken ?? '');
    experienceController =
        TextEditingController(text: '${userData?.experienceYear ?? ''}');
    feesController =
        TextEditingController(text: '${userData?.consultationFee ?? ''}');
    netWorkProfileImage = userData?.image;
    update();
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: ConstRes.imageQuality,
        maxHeight: ConstRes.maxHeight,
        maxWidth: ConstRes.maxWidth);
    if (image != null) {
      profileImage = File(image.path);
    }
    update();
  }

  void updateDoctorDetailsApiCall() {
    log(profileImage?.path ?? '');
    if (profileImage == null && netWorkProfileImage == null) {
      CustomUi.infoSnackBar(S.current.pleaseSelectProfileImage);
      return;
    }
    if (designationController.text.isEmpty) {
      CustomUi.infoSnackBar(S.current.pleaseEnterDesignation);
      return;
    }
    if (degreeController.text.isEmpty) {
      CustomUi.infoSnackBar(S.current.pleaseEnterDegree);
      return;
    }
    if (languageController.text.isEmpty) {
      CustomUi.infoSnackBar(S.current.pleaseEnterLanguages);
      return;
    }
    if (experienceController.text.isEmpty) {
      CustomUi.infoSnackBar(S.current.pleaseEnterYearOfExperience);
      return;
    }
    if (feesController.text.isEmpty) {
      CustomUi.infoSnackBar(S.current.pleaseEnterConsultationFee);
      return;
    }
    CustomUi.loader();
    ApiService.instance
        .updateDoctorDetails(
      image: profileImage,
      designation: designationController.text,
      degrees: degreeController.text,
      languagesSpoken: languageController.text,
      experienceYear: experienceController.text,
      consultationFee: feesController.text.replaceAll(',', ''),
    )
        .then((value) {
      if (value.status == true) {
        Get.back();
        CustomUi.snackBar(
            iconData: Icons.person, message: value.message, positive: true);
        navigateRoot();
      } else {
        Get.back();
        CustomUi.snackBar(iconData: Icons.person, message: value.message);
      }
    });
  }

  void navigateRoot() {
    if (userData?.aboutYouself == null ||
        userData?.educationalJourney == null) {
      Get.off(() => const DoctorProfileScreenTwo());
    } else if (userData?.onlineConsultation == 0 &&
        userData?.clinicConsultation == 0) {
      Get.off(() => const DoctorProfileScreenThree());
    } else {
      Get.offAll(() => const RegistrationSuccessfulScreen());
    }
  }
}
