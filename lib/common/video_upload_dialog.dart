import 'dart:ui';

import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoUploadDialog extends StatelessWidget {
  final VoidCallback selectAnother;

  const VideoUploadDialog({Key? key, required this.selectAnother})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 65),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              const Spacer(flex: 2),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontFamily: FontRes.semiBold, fontSize: 18),
                  children: [
                    TextSpan(
                      text: S.current.tooLarge,
                      style: const TextStyle(color: ColorRes.davyGrey),
                    ),
                    TextSpan(
                      text: ' ${S.current.video}?',
                      style: const TextStyle(color: ColorRes.davyGrey),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  S.current.thisVideoIsGreaterThan15MbEtc,
                  style: const TextStyle(
                      fontFamily: FontRes.semiBold,
                      color: ColorRes.charcoalGrey),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              InkWell(
                highlightColor: ColorRes.transparent,
                splashColor: ColorRes.transparent,
                onTap: selectAnother,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: StyleRes.linearGradient,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    S.current.selectAnother,
                    style: const TextStyle(
                        color: ColorRes.white, fontFamily: FontRes.semiBold),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                highlightColor: ColorRes.transparent,
                splashColor: ColorRes.transparent,
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    S.current.cancel,
                    style: const TextStyle(
                        color: ColorRes.charcoalGrey,
                        fontFamily: FontRes.semiBold),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
