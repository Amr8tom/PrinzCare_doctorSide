import 'dart:developer';

import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_one/doctor_profile_screen_one.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_three/doctor_profile_screeen_three.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_two/doctor_profile_screen_two.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/select_category_screen/select_category_screen.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/starting_profile_screen/starting_profile_screen.dart';
import 'package:doctor_flutter/screen/registration_successful_screen.dart/registration_successful_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreenController extends GetxController {
  TextEditingController fullNameController = TextEditingController(text: "amss");
  TextEditingController emailController = TextEditingController(text: 'amr933tom@gmail.com');
  TextEditingController passwordController = TextEditingController(text: "amr933tomp");
  TextEditingController reTypePasswordController = TextEditingController(text: "amr933tomp");

  bool fullnameError = false;
  bool emailError = false;
  bool passwordError = false;
  bool reTypePasswordError = false;

  String deviceToken = '';
  PrefService prefService = PrefService();

  @override
  void onInit() {
    initPrefService();
    FirebaseMessaging.instance.getToken().then((value) {
      deviceToken = value ?? '';
      log('📩  ${deviceToken.toString()}');
    });
    super.onInit();
  }

  void onRegisterClick() {
    fullnameError = false;
    emailError = false;
    passwordError = false;
    reTypePasswordError = false;
    if (fullNameController.text.trim().isEmpty) {
      fullnameError = true;
    }
    if (emailController.text.trim().isEmpty) {
      emailError = true;
    }

    if (passwordController.text.trim().isEmpty) {
      passwordError = true;
    }
    if (reTypePasswordController.text.trim().isEmpty) {
      reTypePasswordError = true;
    }
    update();
    if (fullnameError || emailError || passwordError || reTypePasswordError) {
      return;
    }
    if (!GetUtils.isEmail(emailController.text.trim())) {
      CustomUi.snackBar(
          iconData: Icons.email,
          positive: false,
          message: S.current.pleaseEnterValidEmail);
      return;
    }
    if (passwordController.text.trim() !=
        reTypePasswordController.text.trim()) {
      CustomUi.snackBar(
          iconData: Icons.password,
          positive: false,
          message: S.current.passwordDosentMatchEnterSamePassword);
      return;
    }
    CustomUi.loader();
    createUserWithEmailAndPassword();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
            // email:"amr933tom@gmail.cp,",
        // password: "123123123123",
      );
      if (credential.user != null) {
        credential.user?.sendEmailVerification();
        registrationApi();
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'weak-password') {
        CustomUi.snackBar(
            iconData: Icons.error,
            message: S.current.thePasswordProvidedIsTooWeak,
            positive: false);
      } else if (e.code == 'email-already-in-use') {
        CustomUi.snackBar(
            iconData: Icons.error,
            message: S.current.theAccountAlreadyExistsForThatEmail,
            positive: false);
      }
    } catch (e) {
      Get.back();
    }
  }

  void registrationApi() {
    ApiService.instance
        .doctorRegistration(
      identity: emailController.text.trim(),
      name: fullNameController.text.trim(),
      deviceToken: deviceToken,
    )
        .then((value) async {
          print(value);
          print(emailController.text.trim());
          print(fullNameController.text.trim());
          print(deviceToken);
      Get.back();
      if (value.status == true) {
        print(value.data);
        print(value.status);
        PrefService.id = value.data?.id ?? -1;
        navigatePage(value.data!);
      } else {
        CustomUi.snackBar(
            iconData: Icons.app_registration,
            positive: false,
            message: value.message);
      }
    });
  }

  void initPrefService() async {
    await prefService.init();
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
      Get.offAll(() => const RegistrationSuccessfulScreen());
    }
  }
}
