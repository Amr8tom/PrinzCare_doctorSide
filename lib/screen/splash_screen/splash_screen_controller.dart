import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/countries/countries.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/auth_screen/auth_screen.dart';
import 'package:doctor_flutter/screen/dashboard_screen/dashboard_screen.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_one/doctor_profile_screen_one.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_three/doctor_profile_screeen_three.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_two/doctor_profile_screen_two.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/select_category_screen/select_category_screen.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/starting_profile_screen/starting_profile_screen.dart';
import 'package:doctor_flutter/screen/registration_successful_screen.dart/registration_successful_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  PrefService prefService = PrefService();
  bool isLogin = false;
  DoctorData? doctorData;
  Countries? country;

  void init() {
    prefData();
  }

  Future<void> prefData() async {
    await prefService.init();
    isLogin = prefService.getLogin(key: kLogin);
    PrefService.id = prefService.getRegistrationData()?.id ?? -1;
    navigateRoot();
  }

  Future<void> navigateRoot() async {
    if (PrefService.id == -1) {
      Get.offAll(() => const AuthScreen());
      // Get.offAll(() => const DashboardScreen());
    } else {
      ApiService.instance.fetchMyDoctorProfile().then((value) {
        if (value.status == true) {
          if (isLogin) {
            if (value.data?.status == 1) {
              Get.offAll(() => const DashboardScreen());
            } else if (value.data?.status == 2) {
              CustomUi.snackBar(
                  iconData: Icons.warning, message: 'Doctor  Banned');
            } else {
              Get.offAll(() => const RegistrationSuccessfulScreen());
            }
          } else {
            navigatePage(value.data!);
          }
        } else {
          CustomUi.snackBar(
              iconData: Icons.not_interested, message: value.message);
        }
      });
    }
  }

  void navigatePage(DoctorData data) {
    if (data.gender == null) {
      Get.offAll(() => const StartingProfileScreen());
    } else if (data.categoryId == null) {
      Get.offAll(() => const SelectCategoryScreen());
    } else if (data.image == null ||
        data.designation == null ||
        data.degrees == null ||
        data.experienceYear == null ||
        data.consultationFee == null) {
      Get.offAll(() => const DoctorProfileScreenOne());
    } else if (data.aboutYouself == null || data.educationalJourney == null) {
      Get.offAll(() => const DoctorProfileScreenTwo());
    } else if (data.onlineConsultation == 0 && data.clinicConsultation == 0) {
      Get.offAll(() => const DoctorProfileScreenThree());
    } else {
      if (isLogin) {
        if (data.status == 1) {
          Get.offAll(() => const DashboardScreen());
        } else if (data.status == 2) {
          CustomUi.snackBar(
              iconData: Icons.warning, message: S.current.doctorBanned);
        } else {
          Get.offAll(() => const RegistrationSuccessfulScreen());
        }
      } else {
        Get.offAll(() => const AuthScreen());
      }
    }
  }
}
