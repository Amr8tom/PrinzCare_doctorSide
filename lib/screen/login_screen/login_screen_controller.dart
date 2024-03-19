import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/dashboard_screen/dashboard_screen.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_one/doctor_profile_screen_one.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_three/doctor_profile_screeen_three.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_two/doctor_profile_screen_two.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/select_category_screen/select_category_screen.dart';
import 'package:doctor_flutter/screen/login_screen/widget/forgot_password_sheet.dart';
import 'package:doctor_flutter/screen/registration_successful_screen.dart/registration_successful_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotController = TextEditingController();
  bool emailError = false;
  bool passwordError = false;
  String deviceToken = '';
  PrefService prefService = PrefService();
  @override
  void onInit() {
    getPref();
    FirebaseMessaging.instance.getToken().then((value) {
      deviceToken = value ?? '';
    });
    super.onInit();
  }
  void onLoginClick() async {
    emailError = false;
    passwordError = false;
    if (emailController.text.trim().isEmpty) {
      emailError = true;
    }
    if (passwordController.text.trim().isEmpty) {
      passwordError = true;
    }
    update();
    if (emailError || passwordError) {
      return;
    }
    if (!GetUtils.isEmail(emailController.text.trim())) {
      CustomUi.snackBar(
          iconData: Icons.email,
          positive: false,
          message: S.current.pleaseEnterValidEmail);
      return;
    }
    CustomUi.loader();
    // UserCredential? user = await signIn(
    //     email: emailController.text.trim(),
    //     password: passwordController.text.trim());
    // if (user == null) return;
    // if (user.user?.emailVerified == true) {
      ApiService.instance
          .doctorLogin(
              identity: emailController.text.trim(),
              deviceToken: deviceToken,
              password: passwordController.text.trim(),
              name: 'asd')
          .then((value) async {
        Get.back();
        if (value.status == true) {
          PrefService.id = value.data?.id ?? -1;
          await prefService.setLogin(key: kLogin, value: true);
          await prefService.saveString(
              key: kPassword, value: passwordController.text);
          if (value.data?.status == 0) {
            navigatePage(value.data!);
          } else {
            Get.offAll(() => const DashboardScreen());
          }
        } else {
          CustomUi.snackBar(
              message: value.message.toString(), iconData: Icons.login);
        }
      });
    // } else {
    //   Get.back();
    //   CustomUi.snackBar(
    //       message: S.current.pleaseVerifiedYourEmail, iconData: Icons.email);
    // }
  }
  ///-------------- SIGN IN METHOD --------------///
  Future<UserCredential?> signIn(
      {required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'user-not-found') {
        CustomUi.snackBar(
            iconData: Icons.email, message: S.current.noUserFoundForThisEmail);
      } else if (e.code == 'wrong-password') {
        CustomUi.snackBar(
            message: S.current.passwordDoesntMatch, iconData: Icons.password);
      }
    }
    return null;
  }
  void getPref() async {
    await prefService.init();
  }
  void navigatePage(DoctorData data) {
    if (data.categoryId == null) {
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
  void onForgotPasswordClick() {
    Get.bottomSheet(
      ForgotPasswordSheet(
        onPressed: () async {
          if (forgotController.text.isEmpty) {
            CustomUi.snackBar(
                message: S.current.pleaseEnterMail, iconData: Icons.mail);
            return;
          }
          try {
            await FirebaseAuth.instance
                .sendPasswordResetEmail(email: forgotController.text.trim());
            Get.back();
            forgotController.clear();
            CustomUi.snackBar(
                message: S.current.emailSentSuccessfullySentYourMail,
                iconData: Icons.email,
                positive: true);
          } on FirebaseAuthException catch (e) {
            CustomUi.snackBar(message: "${e.message}", iconData: Icons.mail);
          }
        },
        forgotController: forgotController,
      ),
    );
  }
}
