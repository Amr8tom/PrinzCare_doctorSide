import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/setting_screen/widget/delete_account_sheet.dart';
import 'package:doctor_flutter/screen/splash_screen/splash_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/firebase_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreenController extends GetxController {
  bool isNotification = false;
  bool isVacationMode = false;
  DoctorData? doctorData;
  PrefService prefService = PrefService();
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onInit() {
    getDoctorProfile();
    super.onInit();
  }

  void onPushNotificationTap() {
    CommonFun.doctorBanned(() {
      updateDoctorDetails(notification: isNotification).then((value) {
        isNotification = doctorData?.isNotification == 1;
      });
    });
  }

  void onVacationModeTap() {
    CommonFun.doctorBanned(() {
      updateDoctorDetails(vacationMode: isVacationMode).then((value) {
        isVacationMode = doctorData?.onVacation == 1;
      });
    });
  }

  void getDoctorProfile() {
    ApiService.instance.fetchMyDoctorProfile().then((value) {
      doctorData = value.data;
      isNotification = value.data?.isNotification == 1;
      isVacationMode = value.data?.onVacation == 1;
      update([kNotification]);
    });
  }

  Future<void> updateDoctorDetails(
      {bool? notification, bool? vacationMode}) async {
    await ApiService.instance
        .updateDoctorDetails(
            notification: notification == true ? 0 : 1,
            vacationMode: vacationMode == true ? 0 : 1)
        .then((value) {
      if (value.status == true) {
        doctorData = value.data;
        update([kNotification]);
        CustomUi.snackBar(
            iconData: Icons.settings, message: value.message, positive: true);
      } else {
        CustomUi.snackBar(iconData: Icons.settings, message: value.message);
      }
    });
  }

  void onLogoutContinueTap() {
    ApiService.instance.logOutDoctor().then((value) async {
      if (value.status == true) {
        CustomUi.snackBar(
            message: value.message,
            iconData: Icons.logout_rounded,
            positive: true);
        FirebaseAuth.instance.signOut();
        await prefService.init();
        await prefService.preferences?.clear();
        PrefService.id = -1;
        Get.offAll(() => const SplashScreen());
      } else {
        CustomUi.snackBar(
            message: value.message, iconData: Icons.logout_rounded);
      }
    });
  }

  void deleteMyAccountTap() {
    if (doctorData?.identity != testingEmail) {
      Get.bottomSheet(
          DeleteAccountSheet(
            onDeleteContinueTap: onDeleteContinueTap,
            title: S.current.deleteMyAccount,
            description: S.current.doYouReallyWantToEtc,
          ),
          isScrollControlled: true);
    } else {
      CustomUi.snackBar(
          iconData: Icons.account_circle_rounded,
          message: S.current.youCantDeleteAAccount);
    }
  }

  void onDeleteContinueTap() {
    CustomUi.loader();
    ApiService.instance.deleteDoctorAccount().then((value) async {
      if (value.status == true) {
        await deleteFirebaseUser();
        await prefService.init();
        await prefService.preferences?.clear();
        Get.back();
        CustomUi.snackBar(
            message: value.message, iconData: Icons.delete_rounded);
        Get.offAll(() => const SplashScreen());
      } else {
        Get.back();
        CustomUi.snackBar(
            message: value.message, iconData: Icons.delete_rounded);
      }
    });
  }

  Future<void> deleteFirebaseUser() async {
    String doctorIdentity = '${doctorData?.id}';
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    await db
        .collection(FirebaseRes.userChatList)
        .doc(doctorIdentity)
        .collection(FirebaseRes.userList)
        .get()
        .then((value) {
      for (var element in value.docs) {
        db
            .collection(FirebaseRes.userChatList)
            .doc(element.id)
            .collection(FirebaseRes.userList)
            .doc(doctorIdentity)
            .update({
          FirebaseRes.isDeleted: true,
          FirebaseRes.deletedId: time,
        });
        db
            .collection(FirebaseRes.userChatList)
            .doc(doctorIdentity)
            .collection(FirebaseRes.userList)
            .doc(element.id)
            .update({
          FirebaseRes.isDeleted: true,
          FirebaseRes.deletedId: time,
        });
      }
    });
  }

  void onLogoutTap() {
    Get.bottomSheet(
        DeleteAccountSheet(
          onDeleteContinueTap: onLogoutContinueTap,
          title: S.current.logout,
          description: S.current.doYouReallyWantToLogoutEtc,
        ),
        isScrollControlled: true);
  }
}
