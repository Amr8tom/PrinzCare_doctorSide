import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomUi {
  static void snackBar({
    String? message,
    bool positive = false,
    required IconData iconData,
  }) {
    Get.rawSnackbar(
      messageText: Text(
        message?.capitalize ?? '',
        style: TextStyle(
            color: positive ? ColorRes.white : ColorRes.lightRed,
            fontFamily: FontRes.medium,
            fontSize: 14),
      ),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      icon: Icon(
        iconData,
        color: positive ? ColorRes.white : ColorRes.lightRed,
        size: 24,
      ),
      backgroundColor: positive ? ColorRes.black : ColorRes.pinkLace,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    );
  }

  static void infoSnackBar(
    String msg,
  ) {
    snackBar(message: msg, iconData: Icons.info_rounded, positive: false);
  }

  static Future loader() {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: ColorRes.havelockBlue,
          ),
        );
      },
    );
  }

  static Widget loaderWidget() {
    return Center(
      // child: CircularProgressIndicator(color: ColorRes.havelockBlue),
      child:Lottie.asset(AssetRes.write_prescreption,height: 130),
    );
  }

  static Widget userPlaceHolder({required num male, double height = 100}) {
    return Container(
      // color: ColorRes.battleshipGrey.withOpacity(0.2),
      color: ColorRes.crystalBlue.withOpacity(0.4),
      height: height,
      width: height,
      padding: const EdgeInsets.all(5),
      child: Image.asset(
        male.genderParse == 1 ? AssetRes.male : AssetRes.feMale,
        height: height,
        width: height,
        color: ColorRes.grey,
      ),
    );
  }

  static Widget doctorPlaceHolder({int? male = 1, double height = 100}) {
    return Container(
      color: ColorRes.lightGrey,
      height: height,
      width: height,
      padding: const EdgeInsets.all(5),
      child: Image.asset(
        // male == 1 ? AssetRes.p1 : AssetRes.p2,
        AssetRes.p3,
        height: height,
        width: height,
      ),
    );
  }

  static Widget noData({String? message}) {
    return Center(
      child: Text(
        message ?? S.current.noData,
        style: const TextStyle(
            color: ColorRes.battleshipGrey, fontFamily: FontRes.semiBold),
      ),
    );
  }

  // static Widget noDataImage({double? size, String? message}) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Image.asset(
  //         AssetRes.noAppointment,
  //         width: size ?? Get.width / 1.5,
  //         height: size ?? Get.width / 1.5,
  //       ),
  //       Text(
  //         message ?? S.current.noData,
  //         style: const TextStyle(
  //             color: ColorRes.battleshipGrey, fontFamily: FontRes.semiBold),
  //       ),
  //     ],
  //   );
  // }
  static Widget noDataImage({double? size, String? message}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AssetRes.nodata),
        Text(
          message ?? S.current.noData,
          style: const TextStyle(
              color: ColorRes.battleshipGrey, fontFamily: FontRes.semiBold),
        ),
      ],
    );
  }
}
