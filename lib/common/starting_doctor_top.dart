import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartingDoctorTop extends StatelessWidget {
  const StartingDoctorTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 1.6,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorRes.crystalBlue,
                  ColorRes.tuftsBlue100,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Image(
            image: const AssetImage(
              // AssetRes.doctor_signin,
              AssetRes.p1,
            ),
            height: Get.height / 1.5,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }
}
