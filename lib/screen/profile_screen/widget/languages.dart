import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/profile_screen/profile_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends StatelessWidget {
  final ProfileScreenController controller;

  const Languages({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.snowDrift,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            S.current.languages.toUpperCase(),
            style: const TextStyle(
                fontSize: 14,
                fontFamily: FontRes.semiBold,
                color: ColorRes.charcoalGrey,
                letterSpacing: 1),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder(
            init: controller,
            builder: (context) {
              return Wrap(
                children: List.generate(
                  controller.doctorData?.languagesSpoken?.split(',').length ??
                      0,
                  (index) {
                    return Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      decoration: BoxDecoration(
                          color: ColorRes.softPeach,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        controller.doctorData?.languagesSpoken
                                ?.split(',')[index]
                                .toString() ??
                            '',
                        style: const TextStyle(
                            color: ColorRes.tuftsBlue,
                            fontFamily: FontRes.semiBold),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
