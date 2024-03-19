import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/registration_screen/registration_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RegistrationScreenController();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarArea(title: S.of(context).registration),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: GetBuilder(
                    init: controller,
                    builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            S
                                .of(context)
                                .pleaseFillYourDetailsAndCompleteRegistrationToStartFind,
                            style: const TextStyle(
                                color: ColorRes.battleshipGrey,
                                fontFamily: FontRes.regular),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextWithTextField(
                            title: S.of(context).fullname,
                            controller: controller.fullNameController,
                            isError: controller.fullnameError,
                          ),
                          TextWithTextField(
                            title: S.of(context).email,
                            controller: controller.emailController,
                            isError: controller.emailError,
                          ),
                          TextWithTextField(
                            title: S.of(context).password,
                            controller: controller.passwordController,
                            isError: controller.passwordError,
                          ),
                          TextWithTextField(
                            title: S.of(context).retypePassword,
                            controller: controller.reTypePasswordController,
                            isError: controller.reTypePasswordError,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextButtonCustom(
                              onPressed: controller.onRegisterClick,
                              title: S.of(context).register,
                              titleColor: ColorRes.darkSkyBlue,
                              backgroundColor:
                                  ColorRes.darkSkyBlue.withOpacity(0.2)),
                          const SizedBox(
                            height: 20,
                          ),
                          const PolicyText(),
                          SizedBox(
                            height: AppBar().preferredSize.height / 3,
                          )
                        ],
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextWithTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isError;

  const TextWithTextField(
      {super.key,
      required this.title,
      required this.controller,
      this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            title,
            style: const TextStyle(
                color: ColorRes.battleshipGrey,
                fontSize: 16,
                fontFamily: FontRes.regular),
          ),
        ),
        Container(
          height: 55,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isError ? ColorRes.ferrariRed : ColorRes.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(1),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide:
                    const BorderSide(color: ColorRes.transparent, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide:
                    const BorderSide(color: ColorRes.transparent, width: 0.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ColorRes.transparent, width: 0.0),
                  borderRadius: BorderRadius.circular(9)),
              fillColor: ColorRes.aquaHaze,
              filled: true,
            ),
            cursorColor: ColorRes.darkJungleGreen,
          ),
        )
      ],
    );
  }
}

class PolicyText extends StatelessWidget {
  const PolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: S.of(context).byProceedingForwardYouAgreeToThen,
          style: const TextStyle(
              fontFamily: FontRes.regular,
              fontSize: 12,
              color: ColorRes.battleshipGrey),
          children: [
            TextSpan(
                text: S.of(context).privacyPolicy,
                style: const TextStyle(
                    fontFamily: FontRes.semiBold,
                    fontSize: 12,
                    color: ColorRes.charcoalGrey),
                recognizer: TapGestureRecognizer()..onTap = () async {}),
            TextSpan(
              text: ' ${S.of(context).and} ',
              style: const TextStyle(
                  fontFamily: FontRes.regular,
                  fontSize: 12,
                  color: ColorRes.battleshipGrey),
            ),
            TextSpan(
                text: S.of(context).termsConditions,
                style: const TextStyle(
                    fontFamily: FontRes.semiBold,
                    fontSize: 12,
                    color: ColorRes.charcoalGrey),
                recognizer: TapGestureRecognizer()..onTap = () async {}),
          ],
        ),
      ),
    );
  }
}
