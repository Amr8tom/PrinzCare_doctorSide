import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/registration_screen/registration_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordSheet extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController forgotController;

  const ForgotPasswordSheet(
      {super.key, required this.onPressed, required this.forgotController});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).forgotPassword,
                    style: const TextStyle(fontSize: 24),
                  ),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.close_rounded))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextWithTextField(
                title: S.of(context).password,
                controller: forgotController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButtonCustom(
                onPressed: onPressed,
                title: S.of(context).send,
                titleColor: ColorRes.darkSkyBlue,
                backgroundColor: ColorRes.darkSkyBlue.withOpacity(0.2),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
