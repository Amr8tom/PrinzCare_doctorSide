import 'package:doctor_flutter/screen/video_call_screen/video_call_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/material.dart';

class BottomButtonArea extends StatelessWidget {
  final VideoCallScreenController controller;

  const BottomButtonArea({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: ColorRes.darkJungleGreen.withOpacity(0.2),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: controller.muteUnMute,
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    color: ColorRes.white, shape: BoxShape.circle),
                child: Icon(
                  controller.isMuted ? Icons.keyboard_voice : Icons.mic_off,
                  color: ColorRes.davyGrey,
                ),
              ),
            ),
            InkWell(
              onTap: controller.videoDisable,
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: StyleRes.linearGradient,
                  border: Border.all(color: ColorRes.white, width: 2.5),
                ),
                child: Icon(
                  controller.isVideo ? Icons.videocam : Icons.videocam_off,
                  color: ColorRes.white,
                ),
              ),
            ),
            InkWell(
              onTap: controller.leave,
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    color: ColorRes.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.exit_to_app,
                  color: ColorRes.ferrariRed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
