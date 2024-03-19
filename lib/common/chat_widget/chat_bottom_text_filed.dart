import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/material.dart';

class ChatBottomTextFiled extends StatelessWidget {
  final TextEditingController msgController;
  final VoidCallback onSendTap;
  final VoidCallback onTextFiledTap;
  final FocusNode msgFocusNode;

  const ChatBottomTextFiled(
      {Key? key,
      required this.msgController,
      required this.onSendTap,
      required this.onTextFiledTap,
      required this.msgFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          color: ColorRes.snowDrift,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          alignment: Alignment.center,
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 43,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                        color: ColorRes.dawnPink,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: msgController,
                            onTap: onTextFiledTap,
                            focusNode: msgFocusNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              isDense: true,
                            ),
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: FontRes.regular,
                                color: ColorRes.davyGrey),
                            cursorHeight: 14,
                            cursorColor: ColorRes.davyGrey,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        InkWell(
                          onTap: onSendTap,
                          child: Container(
                            height: 47,
                            width: 47,
                            padding: const EdgeInsets.only(left: 10, right: 5),
                            decoration: const BoxDecoration(
                              gradient: StyleRes.linearGradient,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.send,
                              color: ColorRes.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                const SizedBox(
                  height: 38,
                  width: 38,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
