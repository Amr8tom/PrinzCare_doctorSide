import 'dart:async';

import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class OtpSheetController extends GetxController {
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  int timerCount = 30;
  String? _verificationId;
  Timer? _timer;
  PhoneNumber? phoneNumber;

  @override
  void onInit() {
    phoneNumber = Get.arguments[0];
    _verificationId = Get.arguments[1];
    timerForOtp();
    super.onInit();
  }

  void verifyOtp() async {
    if (otpController.text.isEmpty) {
      CustomUi.snackBar(
          message: S.current.pleaseEnterYourOtp,
          iconData: Icons.numbers_rounded);
      return;
    }
    CustomUi.loader();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: '$_verificationId', smsCode: otpController.text);
      await auth.signInWithCredential(credential).then((value) {
        ApiService.instance
            .updateDoctorDetails(
                mobileNumber:
                    '${phoneNumber?.dialCode} ${phoneNumber?.phoneNumber?.replaceAll('${phoneNumber?.dialCode}', '')}')
            .then((value) {
          Get.back();
          Get.back();
        });
      });
    } catch (e) {
      Get.back();
      CustomUi.snackBar(
          message: S.current.smsVerificationCodeEtc,
          iconData: Icons.verified_rounded);
    }
  }

  Future<void> resendOtp() async {
    CustomUi.loader();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber?.phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) {},
      verificationFailed: (FirebaseAuthException e) {
        Get.back();
        if (e.code == 'invalid-phone-number') {
          CustomUi.snackBar(
              message: S.current.theProvidedPhoneEtc,
              iconData: Icons.not_interested_rounded);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.back();
        _timer?.cancel();
        timerCount = 30;
        timerForOtp();
      },
      codeAutoRetrievalTimeout: (String verId) {},
    );
  }

  void timerForOtp() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timerCount != 0) {
          timerCount--;
          update([kTimerUpdate]);
        }
      },
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}
