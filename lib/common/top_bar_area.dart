import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBarArea extends StatelessWidget {
  final String title;
  final bool isMoreBtnVisible;
  final Function()? onVideoCallTap;

  const TopBarArea({
    Key? key,
    required this.title,
    this.isMoreBtnVisible = false,
    this.onVideoCallTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorRes.whiteSmoke,
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Directionality.of(context) == TextDirection.rtl
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    margin: EdgeInsets.only(
                        left: Directionality.of(context) == TextDirection.rtl
                            ? 0
                            : 10,
                        right: Directionality.of(context) == TextDirection.rtl
                            ? 10
                            : 0),
                    child: const Icon(Icons.arrow_back_rounded)),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: ColorRes.charcoalGrey,
                  fontFamily: FontRes.bold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis),
            ),
            Align(
              alignment: Directionality.of(context) == TextDirection.rtl
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Visibility(
                visible: isMoreBtnVisible,
                child: InkWell(
                  onTap: onVideoCallTap,
                  child: Container(
                    height: 36,
                    width: 36,
                    margin: EdgeInsets.only(
                        right: Directionality.of(context) == TextDirection.rtl
                            ? 0
                            : 10,
                        left: Directionality.of(context) == TextDirection.rtl
                            ? 10
                            : 0),
                    decoration: const BoxDecoration(
                        gradient: StyleRes.linearGradient,
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.videocam_sharp,
                      color: ColorRes.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
