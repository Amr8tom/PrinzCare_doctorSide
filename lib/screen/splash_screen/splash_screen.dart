import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/starting_doctor_top.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/splash_screen/splash_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController()).init();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StartingDoctorTop(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    ConstRes.appName.toUpperCase(),
                    style: const TextStyle(
                        fontFamily: FontRes.black, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.current.craftYourProfileEtc,
                    style: const TextStyle(
                        fontFamily: FontRes.light,
                        fontSize: 16,
                        color: ColorRes.charcoalGrey),
                  ),
                  const Spacer(),
                  CustomUi.loaderWidget(),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

