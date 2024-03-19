import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/chat/appointment_chat.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCallCard extends StatelessWidget {
  final AppointmentChat data;
  final Function(AppointmentChat data) onJoinMeeting;

  const VideoCallCard(
      {Key? key, required this.data, required this.onJoinMeeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: Get.width / 1.4,
      ),
      decoration: BoxDecoration(
        color: ColorRes.whiteSmoke,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: S.current.video.toUpperCase(),
                    style: const TextStyle(
                        color: ColorRes.tuftsBlue,
                        fontFamily: FontRes.extraBold,
                        fontSize: 14),
                    children: [
                      TextSpan(
                        text: " ${S.current.consultation}",
                        style: const TextStyle(
                            color: ColorRes.tuftsBlue,
                            fontFamily: FontRes.medium,
                            fontSize: 13,
                            letterSpacing: 0.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '${data.senderUser?.name} ${S.current.isAskingYouToJoinEtc} ',
                  style:
                      const TextStyle(color: ColorRes.davyGrey, fontSize: 14),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  (data.videoCall?.time ?? milliDate)
                      .dateMilliFormat(ddMmmYyyyDesHhMmA),
                  style: const TextStyle(
                      color: ColorRes.tuftsBlue,
                      fontFamily: FontRes.semiBold,
                      fontSize: 13),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => onJoinMeeting(data),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: data.videoCall?.isStarted == true
                      ? ColorRes.davyGrey
                      : ColorRes.davyGrey.withOpacity(0.3),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(15))),
              alignment: Alignment.center,
              child: Text(
                (data.videoCall?.isStarted == true
                        ? S.current.joinMeeting
                        : S.current.endMeeting)
                    .toUpperCase(),
                style: const TextStyle(
                    color: ColorRes.white,
                    fontSize: 13,
                    fontFamily: FontRes.semiBold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
