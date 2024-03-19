import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/personal_information_screen/otp_sheet/otp_sheet_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpSheet extends StatelessWidget {
  const OtpSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpSheetController());
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.current.weHaveSentOtpEtc,
                  style: const TextStyle(
                      fontSize: 16, color: ColorRes.battleshipGrey),
                ),
                const SizedBox(
                  height: 40,
                ),
                GetBuilder(
                    init: controller,
                    builder: (context) {
                      return Text(
                        '${controller.phoneNumber?.dialCode} ${controller.phoneNumber?.phoneNumber?.replaceAll('${controller.phoneNumber?.dialCode}', '')}',
                        style: const TextStyle(
                            fontFamily: FontRes.bold,
                            fontSize: 22,
                            color: ColorRes.charcoalGrey),
                      );
                    }),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: ColorRes.whiteSmoke,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: controller.otpController,
                    textAlign: TextAlign.center,
                    maxLength: 6,
                    decoration: InputDecoration(
                      isDense: true,
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: S.current.enterYourOtp,
                      hintStyle: const TextStyle(
                          fontFamily: FontRes.semiBold,
                          color: ColorRes.silverChalice),
                    ),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: ColorRes.charcoalGrey,
                      fontFamily: FontRes.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButtonCustom(
                  onPressed: controller.verifyOtp,
                  backgroundColor: ColorRes.darkSkyBlue,
                  titleColor: ColorRes.white,
                  title: S.current.submit,
                ),
                const SizedBox(
                  height: 10,
                ),
                SafeArea(
                  top: false,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        GetBuilder(
                          id: kTimerUpdate,
                          init: controller,
                          builder: (context) {
                            String strDigits(int n) =>
                                n.toString().padLeft(2, '0');
                            return Text(
                              "00:${strDigits(controller.timerCount)}",
                              style: const TextStyle(
                                  color: ColorRes.battleshipGrey,
                                  fontFamily: FontRes.semiBold,
                                  fontSize: 15),
                            );
                          },
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            if (controller.timerCount == 0) {
                              controller.resendOtp();
                            }
                          },
                          child: GetBuilder(
                            id: kTimerUpdate,
                            init: controller,
                            builder: (context) {
                              return Text(
                                S.current.reSend,
                                style: TextStyle(
                                  color: controller.timerCount == 0
                                      ? ColorRes.battleshipGrey
                                      : ColorRes.nobel,
                                  fontFamily: FontRes.semiBold,
                                  fontSize: 15,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
