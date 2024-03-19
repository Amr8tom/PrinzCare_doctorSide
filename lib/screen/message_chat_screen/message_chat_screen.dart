import 'package:doctor_flutter/common/chat_widget/chat_bottom_text_filed.dart';
import 'package:doctor_flutter/common/fancy_button.dart';
import 'package:doctor_flutter/screen/message_chat_screen/message_chat_screen_controller.dart';
import 'package:doctor_flutter/screen/message_chat_screen/widget/message_center_area.dart';
import 'package:doctor_flutter/screen/message_chat_screen/widget/message_chat_top_bar.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MessageChatScreen extends StatelessWidget {
  const MessageChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MessageChatScreenController();
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: GestureDetector(
        onTap: controller.allScreenTap,
        child: GetBuilder(
          init: controller,
          builder: (controller) => Stack(
            children: [
              Column(
                children: [
                  MessageChatTopBar(
                      conversation: controller.conversation,
                      controller: controller),
                  MessageCenterArea(
                    scrollController: controller.scrollController,
                    chatData: controller.chatData,
                    doctorData: controller.doctorData,
                    onLongPress: controller.onLongPress,
                    timeStamp: controller.timeStamp,
                  ),
                  ChatBottomTextFiled(
                      msgController: controller.msgController,
                      onSendTap: controller.onSendBtnTap,
                      onTextFiledTap: controller.onTextFiledTap,
                      msgFocusNode: controller.msgFocusNode),
                ],
              ),
              Positioned(
                right:
                    Directionality.of(context) == TextDirection.rtl ? null : 6,
                bottom: 3,
                left:
                    Directionality.of(context) == TextDirection.rtl ? 6 : null,
                child: SafeArea(
                  top: false,
                  child: FancyButton(
                    key: controller.key,
                    onCameraTap: () =>
                        controller.onImageTap(source: ImageSource.camera),
                    onGalleryTap: () =>
                        controller.onImageTap(source: ImageSource.gallery),
                    onVideoTap: controller.onVideoTap,
                    isOpen: controller.isOpen,
                    msgFocusNode: controller.msgFocusNode,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
