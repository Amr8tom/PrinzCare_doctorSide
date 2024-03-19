import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashboardScreenController extends GetxController {
  int currentIndex = 0;
  final inactiveColor = ColorRes.grey;
  PrefService prefService = PrefService();

  DoctorData? doctorData;

  @override
  void onInit() {
    prefData();
    super.onInit();
  }

  void onItemSelected(int value) {
    if (doctorData?.status == 2) {
      HapticFeedback.heavyImpact();
      if ([1, 2, 3].any((element) {
        return element == value;
      })) {
        CustomUi.snackBar(
            message: S.current.doctorBlockByAdmin,
            iconData: Icons.dangerous_rounded);
        return;
      }
    }
    currentIndex = value;
    update();
  }

  Future<void> prefData() async {
    await prefService.init();
    doctorData = prefService.getRegistrationData();
    update();
  }
}
