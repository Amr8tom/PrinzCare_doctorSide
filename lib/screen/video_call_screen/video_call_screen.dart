import 'dart:ui';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:doctor_flutter/model/chat/appointment_chat.dart';
import 'package:doctor_flutter/screen/video_call_screen/video_call_screen_controller.dart';
import 'package:doctor_flutter/screen/video_call_screen/widget/bottom_buttom_area.dart';
import 'package:doctor_flutter/screen/video_call_screen/widget/top_bar_name_card.dart';
import 'package:doctor_flutter/screen/video_call_screen/widget/video_call_placeholder.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCallScreen extends StatelessWidget {
  final AppointmentChat appointmentChat;

  const VideoCallScreen({Key? key, required this.appointmentChat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoCallScreenController(appointmentChat));
    return Scaffold(
      backgroundColor: ColorRes.black,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: GetBuilder(
          init: controller,
          builder: (controller) {
            return Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: controller.remoteUserId != null
                      ? Stack(
                          children: [
                            controller.isRemoteMutedVideo ||
                                    controller.type == 1

                                /// If remote user mute video and left the meeting ///
                                ? RemotePlaceHolder(
                                    image: appointmentChat
                                            .videoCall?.patientImage ??
                                        '',
                                    name: appointmentChat
                                            .videoCall?.patientImage?[0] ??
                                        '',
                                    widget: const SizedBox())

                                /// If Remote User enter ///
                                : AgoraVideoView(
                                    controller: VideoViewController.remote(
                                      rtcEngine: controller.agoraEngine,
                                      canvas: VideoCanvas(
                                          uid: controller.remoteUserId),
                                      connection: RtcConnection(
                                          channelId: appointmentChat
                                              .videoCall?.channelId),
                                    ),
                                  ),

                            /// Remote user mute video, left meeting, and mute audio ///
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Row(),
                                controller.isRemoteMutedVideo
                                    ? ClipOval(
                                        child: Image.network(
                                          '${ConstRes.itemBaseURL}${appointmentChat.videoCall?.patientImage}',
                                          width: 100,
                                          height: 100,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return BlurImageTextCard(
                                                name: appointmentChat.videoCall
                                                        ?.patientImage?[0] ??
                                                    '');
                                          },
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 10,
                                ),
                                controller.type == 1
                                    ? BlurTextCard(
                                        name:
                                            '${appointmentChat.videoCall?.patientName ?? ''} Left the meeting')
                                    : !controller.isRemoteMutedAudio
                                        ? const SizedBox()
                                        : BlurTextCard(
                                            name:
                                                '${appointmentChat.videoCall?.patientName ?? ''} Mute the Audio'),
                              ],
                            )
                          ],
                        )

                      /// If remote user not enter the meeting ///
                      : RemotePlaceHolder(
                          image: appointmentChat.videoCall?.patientImage ?? '',
                          name:
                              appointmentChat.videoCall?.patientImage?[0] ?? '',
                          widget: BlurTextCard(
                              name:
                                  'Waiting for ${appointmentChat.videoCall?.patientName ?? ''}')),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      TopBarNameCard(controller: controller),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 105,
                          height: 138,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: controller.isJoined

                              /// I am enter the meeting ///
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: controller.isVideo
                                      ? AgoraVideoView(
                                          controller: VideoViewController(
                                            rtcEngine: controller.agoraEngine,
                                            canvas: const VideoCanvas(uid: 0),
                                          ),
                                        )
                                      : LocalPlaceHolder(
                                          image:
                                              '${appointmentChat.senderUser?.image}',
                                          name: appointmentChat.senderUser?.name
                                                  ?.replaceAll('Dr.', '')
                                                  .trim()[0] ??
                                              ''),
                                )

                              /// I am not enter the meeting ///
                              : LocalPlaceHolder(
                                  image: '${appointmentChat.senderUser?.image}',
                                  name: appointmentChat.senderUser?.name
                                          ?.replaceAll('Dr.', '')
                                          .trim()[0] ??
                                      ''),
                        ),
                      ),
                      const Spacer(),
                      BottomButtonArea(controller: controller)
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class BlurImageTextCard extends StatelessWidget {
  final String name;

  const BlurImageTextCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: ColorRes.grey.withOpacity(0.5)),
      alignment: Alignment.center,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Text(
          name,
          // style: MyTextStyle.montserratBlack(color: ColorRes.white, size: 35),
          style: const TextStyle(
              color: ColorRes.white, fontSize: 35, fontFamily: FontRes.black),
        ),
      ),
    );
  }
}

class BlurTextCard extends StatelessWidget {
  final String name;

  const BlurTextCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(color: ColorRes.grey.withOpacity(0.5)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Text(
            name,
            style: const TextStyle(
                fontFamily: FontRes.light, color: ColorRes.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
