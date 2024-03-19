import 'package:doctor_flutter/common/chat_widget/chat_date_formate.dart';
import 'package:doctor_flutter/common/chat_widget/chat_image_card.dart';
import 'package:doctor_flutter/common/chat_widget/chat_msg_text_card.dart';
import 'package:doctor_flutter/common/chat_widget/chat_video_card.dart';
import 'package:doctor_flutter/model/chat/appointment_chat.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/appointment_chat_screen/widget/video_call_card.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/firebase_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CenterAreaChat extends StatelessWidget {
  final ScrollController scrollController;
  final List<AppointmentChat> chatData;
  final DoctorData? doctorData;
  final Function(AppointmentChat data) onJoinMeeting;

  const CenterAreaChat(
      {Key? key,
      required this.scrollController,
      required this.chatData,
      this.doctorData,
      required this.onJoinMeeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            itemCount: chatData.length,
            padding: EdgeInsets.zero,
            reverse: true,
            itemBuilder: (context, index) {
              AppointmentChat data = chatData[index];
              return data.senderUser?.userId == doctorData?.id
                  ? _yourMsg(data, onJoinMeeting)
                  : _otherMsg(data);
            },
          ),
        ),
      ),
    );
  }

  _yourMsg(
    AppointmentChat data,
    Function(AppointmentChat data) onJoinMeeting,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        data.msgType == FirebaseRes.text
            ? ChatMsgTextCard(
                msg: data.msg ?? '',
                cardColor: ColorRes.whiteSmoke,
                textColor: ColorRes.davyGrey)
            : data.msgType == FirebaseRes.image
                ? ChatImageCard(
                    imageUrl: data.image,
                    time: data.id,
                    imageCardColor: ColorRes.whiteSmoke,
                    margin: EdgeInsets.only(
                      left: Get.width / 2.3,
                    ),
                    msg: data.msg,
                    imageTextColor: ColorRes.davyGrey,
                  )
                : data.msgType == FirebaseRes.video
                    ? ChatVideoCard(
                        imageUrl: data.image,
                        videoUrl: data.video,
                        time: data.id,
                        imageCardColor: ColorRes.whiteSmoke,
                        margin: EdgeInsets.only(
                          left: Get.width / 2.3,
                        ),
                        msg: data.msg,
                        imageTextColor: ColorRes.davyGrey)
                    : data.msgType == FirebaseRes.videoCall
                        ? VideoCallCard(
                            data: data, onJoinMeeting: onJoinMeeting)
                        : const SizedBox(),
        ChatDateFormat(time: data.id)
      ],
    );
  }

  _otherMsg(AppointmentChat data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        data.msgType == FirebaseRes.text
            ? ChatMsgTextCard(
                msg: data.msg ?? '',
                cardColor: ColorRes.havelockBlue,
                textColor: ColorRes.white)
            : data.msgType == FirebaseRes.image
                ? ChatImageCard(
                    imageUrl: data.image,
                    time: data.id,
                    msg: data.msg,
                    imageCardColor: ColorRes.havelockBlue,
                    margin: EdgeInsets.only(
                      right: Get.width / 2.3,
                    ),
                    imageTextColor: ColorRes.white)
                : ChatVideoCard(
                    imageUrl: data.image,
                    videoUrl: data.video,
                    time: data.id,
                    msg: data.msg,
                    imageCardColor: ColorRes.havelockBlue,
                    margin: EdgeInsets.only(
                      right: Get.width / 2.3,
                    ),
                    imageTextColor: ColorRes.white),
        ChatDateFormat(time: data.id ?? '')
      ],
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
