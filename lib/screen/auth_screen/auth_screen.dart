import 'package:doctor_flutter/common/starting_doctor_top.dart';
import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/login_screen/login_screen.dart';
import 'package:doctor_flutter/screen/registration_screen/registration_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const StartingDoctorTop(),
          const Spacer(),
          Text(
            S
                .of(context)
                .appointmentOnlineDiagnosticBookingManagementMultivendorApp,
            style: const TextStyle(
                color: ColorRes.charcoalGrey,
                fontSize: 16,
                fontFamily: FontRes.bold),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Text(
            S
                .of(context)
                .craftYourProfileGetAppointmentsAcceptThemProvideConsultationMake,
            style: const TextStyle(color: ColorRes.charcoalGrey),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          TextButtonCustom(
            onPressed: () {
              Get.to(() => const RegistrationScreen());
            },
            title: S.of(context).register,
            titleColor: ColorRes.tuftsBlue100,
            backgroundColor: ColorRes.tuftsBlue100.withOpacity(0.20),
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              text: S.of(context).alreadyHaveAnAccount,
              style: const TextStyle(
                  color: ColorRes.charcoalGrey, fontFamily: FontRes.light),
              children: [
                TextSpan(
                    text: S.of(context).logIn,
                    style: const TextStyle(
                        color: ColorRes.charcoalGrey,
                        fontFamily: FontRes.semiBold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const LoginScreen());
                      }),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
