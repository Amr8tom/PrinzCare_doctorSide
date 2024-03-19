import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/chat/chat.dart';
import 'package:doctor_flutter/screen/message_chat_screen/message_chat_screen_controller.dart';
import 'package:doctor_flutter/screen/message_chat_screen/widget/bottom_selected_item_bar.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageChatTopBar extends StatelessWidget {
  final Conversation conversation;
  final MessageChatScreenController controller;

  const MessageChatTopBar(
      {Key? key, required this.conversation, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatUser? user = conversation.user;
    return Container(
      width: double.infinity,
      color: ColorRes.whiteSmoke,
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: controller.timeStamp.isEmpty ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 25,
                      color: ColorRes.davyGrey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorRes.tuftsBlue, width: 2.5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        imageUrl: '${ConstRes.itemBaseURL}${user?.image}',
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return CustomUi.userPlaceHolder(
                            height: 70,
                            male: conversation.user?.gender == S.current.male
                                ? 1
                                : 0,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.username ?? S.current.unKnown,
                          style: const TextStyle(
                            fontFamily: FontRes.extraBold,
                            color: ColorRes.davyGrey,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          ((user?.age ?? '0') == '0')
                              ? user?.gender == 'Male'
                                  ? S.current.male
                                  : S.current.feMale
                              : "${user?.age} ${S.current.years} : ${user?.gender == 'Male' ? S.current.male : S.current.feMale}",
                          style: const TextStyle(
                            fontFamily: FontRes.medium,
                            color: ColorRes.battleshipGrey,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: controller.timeStamp.isNotEmpty ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Visibility(
                visible: controller.timeStamp.isNotEmpty,
                child: BottomSelectedItemBar(
                  onBackTap: controller.onMsgDeleteBackTap,
                  selectedItemCount: controller.timeStamp.length,
                  onItemDelete: () {
                    Get.dialog(
                      ConfirmationDialog(
                        onPositiveBtn: controller.onChatItemDelete,
                        title: controller.timeStamp.length == 1
                            ? '${S.current.deleteMessage}?'
                            : '${S.current.delete} ${controller.timeStamp.length} ${S.current.messages}?',
                        positiveText: S.current.deleteForMe,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onPositiveBtn;
  final String title;
  final String positiveText;
  final Color positiveTextColor;
  final double aspectRatio;
  final String? title2;

  const ConfirmationDialog({
    Key? key,
    required this.onPositiveBtn,
    required this.title,
    required this.positiveText,
    this.aspectRatio = 1 / 0.5,
    this.positiveTextColor = ColorRes.havelockBlue,
    this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: const ColorFilter.srgbToLinearGamma(),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 50),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  S.current.appName,
                  style: const TextStyle(
                      fontSize: 24,
                      fontFamily: FontRes.black,
                      color: ColorRes.charcoalGrey),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                      text: title,
                      style: const TextStyle(
                          color: ColorRes.davyGrey,
                          fontSize: 16,
                          fontFamily: FontRes.semiBold),
                      children: [
                        TextSpan(
                            text: '\n${title2 ?? ''}',
                            style: const TextStyle(
                              color: ColorRes.battleshipGrey,
                              fontSize: 13,
                            )),
                      ]),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        S.current.cancel,
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: FontRes.medium,
                            color: ColorRes.havelockBlue),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: onPositiveBtn,
                      child: Text(
                        positiveText,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: FontRes.medium,
                          color: positiveTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
