import 'package:doctor_flutter/common/starting_doctor_top.dart';
import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/login_screen/login_screen_controller.dart';
import 'package:doctor_flutter/screen/registration_screen/registration_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginScreenController();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const StartingDoctorTop(),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder(
                    init: controller,
                    builder: (controller) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            TextWithTextField(
                                title: S.of(context).email,
                                controller: controller.emailController),
                            TextWithTextField(
                                title: S.of(context).password,
                                controller: controller.passwordController),
                            TextButtonCustom(
                              onPressed: controller.onLoginClick,
                              title: S.of(context).login,
                              titleColor: ColorRes.tuftsBlue100,
                              backgroundColor:
                                  ColorRes.tuftsBlue100.withOpacity(0.2),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: controller.onForgotPasswordClick,
                                child: Text(
                                  S.of(context).forgetPassword,
                                  style: const TextStyle(
                                      fontFamily: FontRes.bold,
                                      fontSize: 16,
                                      color: ColorRes.charcoalGrey),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                const PolicyText(),
                SizedBox(
                  height: AppBar().preferredSize.height / 3,
                )
              ],
            ),
          ),
          SafeArea(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const SizedBox(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back,
                  color: ColorRes.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
