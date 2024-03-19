import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMsgTextCard extends StatelessWidget {
  final String msg;
  final Color cardColor;
  final Color textColor;

  const ChatMsgTextCard(
      {Key? key,
      required this.msg,
      required this.cardColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: Get.width / 1.3,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        msg,
        style: TextStyle(color: textColor, fontSize: 14),
      ),
    );
  }
}
