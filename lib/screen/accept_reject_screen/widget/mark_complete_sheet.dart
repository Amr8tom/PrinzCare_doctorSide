import 'package:doctor_flutter/common/doctor_profile_text_filed.dart';
import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/accept_reject_screen/accept_reject_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarkCompleteSheet extends StatelessWidget {
  final VoidCallback onTap;
  final AcceptRejectScreenController controller;

  const MarkCompleteSheet(
      {Key? key, required this.onTap, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppBar().preferredSize.height * 2),
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Text(
                  S.current.summary,
                  style: const TextStyle(
                    fontFamily: FontRes.extraBold,
                    color: ColorRes.charcoalGrey,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 37,
                    width: 37,
                    decoration: const BoxDecoration(
                        color: ColorRes.iceberg, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.close_rounded,
                      color: ColorRes.charcoalGrey,
                      size: 22,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                GetBuilder(
                    init: controller,
                    builder: (context) {
                      return DoctorProfileTextField(
                        isExample: false,
                        isExpand: true,
                        title: S.current.diagnosedWith,
                        exampleTitle: "",
                        hintTitle: S.current.writeHere,
                        controller: controller.diagnosedController,
                        textFieldHeight: 150,
                        errorColor: controller.isDiagnosed
                            ? ColorRes.bittersweet.withOpacity(0.2)
                            : ColorRes.whiteSmoke,
                        hintTextColor: controller.isDiagnosed
                            ? ColorRes.bittersweet
                            : ColorRes.silverChalice,
                      );
                    }),
                GetBuilder(
                    init: controller,
                    builder: (context) {
                      return DoctorProfileTextField(
                        isExample: false,
                        title: S.current.completionOtp,
                        exampleTitle: "",
                        hintTitle: S.current.enterHere,
                        controller: controller.completionOtpController,
                        textInputType: TextInputType.number,
                        maxLength: 4,
                        textAlign: TextAlign.center,
                        errorColor: controller.isCompletionOtp
                            ? ColorRes.bittersweet.withOpacity(0.2)
                            : ColorRes.whiteSmoke,
                        hintTextColor: controller.isCompletionOtp
                            ? ColorRes.bittersweet
                            : ColorRes.silverChalice,
                      );
                    }),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )),
          TextButtonCustom(
            onPressed: onTap,
            title: S.current.submit,
            titleColor: ColorRes.white,
            backgroundColor: ColorRes.darkSkyBlue,
          )
        ],
      ),
    );
  }
}
