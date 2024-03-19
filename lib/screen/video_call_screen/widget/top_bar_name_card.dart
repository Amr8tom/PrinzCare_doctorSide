import 'package:doctor_flutter/screen/video_call_screen/video_call_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class TopBarNameCard extends StatelessWidget {
  final VideoCallScreenController controller;

  const TopBarNameCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: ColorRes.darkJungleGreen.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          InkWell(
            onTap: controller.leave,
            child: const Icon(
              Icons.arrow_back,
              color: ColorRes.white,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                controller.appointmentChat.videoCall?.patientName ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: FontRes.extraBold,
                  fontSize: 17,
                  color: ColorRes.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
