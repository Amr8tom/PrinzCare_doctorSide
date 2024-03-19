import 'package:doctor_flutter/common/chat_widget/chat_date_formate.dart';
import 'package:doctor_flutter/common/chat_widget/chat_image_card.dart';
import 'package:doctor_flutter/common/chat_widget/chat_msg_text_card.dart';
import 'package:doctor_flutter/common/chat_widget/chat_video_card.dart';
import 'package:doctor_flutter/model/chat/chat.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/firebase_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageCenterArea extends StatelessWidget {
  final ScrollController scrollController;
  final List<ChatMessage> chatData;
  final DoctorData? doctorData;
  final Function(ChatMessage? chatMessage) onLongPress;
  final List<String> timeStamp;

  const MessageCenterArea(
      {Key? key,
      required this.scrollController,
      required this.chatData,
      required this.doctorData,
      required this.onLongPress,
      required this.timeStamp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: chatData.length,
        reverse: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          ChatMessage? data = chatData[index];
          return data.senderUser?.userid == doctorData?.id
              ? _yourMsg(data)
              : _otherMsg(data);
        },
      ),
    );
  }

  _yourMsg(ChatMessage data) {
    bool selected = timeStamp.contains('${data.id}');
    return GestureDetector(
      onLongPress: () {
        onLongPress(data);
      },
      onTap: () {
        timeStamp.isNotEmpty ? onLongPress(data) : () {};
      },
      child: Container(
        color: selected ? ColorRes.iceberg : ColorRes.transparent,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                          left: Get.width / 2.3,
                        ),
                        imageTextColor: ColorRes.white)
                    : ChatVideoCard(
                        imageUrl: data.image,
                        time: data.id,
                        msg: data.msg,
                        margin: EdgeInsets.only(
                          left: Get.width / 2.3,
                        ),
                        videoUrl: data.video,
                        imageCardColor: ColorRes.havelockBlue,
                        imageTextColor: ColorRes.white),
            ChatDateFormat(time: data.id ?? '')
          ],
        ),
      ),
    );
  }

  _otherMsg(
    ChatMessage data,
  ) {
    bool selected = timeStamp.contains('${data.id}');
    return GestureDetector(
      onLongPress: () {
        onLongPress(data);
      },
      onTap: () {
        timeStamp.isNotEmpty ? onLongPress(data) : () {};
      },
      child: Container(
        color: selected ? ColorRes.iceberg : ColorRes.transparent,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          right: Get.width / 2.3,
                        ),
                        msg: data.msg,
                        imageTextColor: ColorRes.davyGrey)
                    : ChatVideoCard(
                        imageUrl: data.image,
                        time: data.id,
                        margin: EdgeInsets.only(
                          right: Get.width / 2.3,
                        ),
                        msg: data.msg,
                        videoUrl: data.video,
                        imageCardColor: ColorRes.whiteSmoke,
                        imageTextColor: ColorRes.davyGrey),
            ChatDateFormat(time: data.id ?? '')
          ],
        ),
      ),
    );
  }
}
