import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/chat/chat.dart';
import 'package:doctor_flutter/screen/message_chat_screen/message_chat_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageCard extends StatelessWidget {
  final List<Conversation?> userList;
  final Function(Conversation? user) onLongPress;

  const MessageCard(
      {Key? key, required this.userList, required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: userList.isEmpty
          ? CustomUi.noDataImage(message: S.current.noUser)
          : ListView.builder(
              itemCount: userList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                Conversation? user = userList[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => const MessageChatScreen(), arguments: user);
                  },
                  onLongPress: () => onLongPress(user),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    decoration: const BoxDecoration(
                      color: ColorRes.whiteSmoke,
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ConstRes.itemBaseURL}${user?.user?.image}',
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return CustomUi.userPlaceHolder(
                                  height: 70,
                                  male: user?.user?.gender == S.current.male
                                      ? 1
                                      : 0);
                            },
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
                                user?.user?.username ?? S.current.unKnown,
                                style: const TextStyle(
                                    color: ColorRes.charcoalGrey,
                                    fontFamily: FontRes.extraBold,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                user?.lastMsg ?? '',
                                style: const TextStyle(
                                    color: ColorRes.battleshipGrey,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              CommonFun.timeAgo(
                                DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(user?.time ?? ''),
                                ),
                              ),
                              style: const TextStyle(
                                  fontFamily: FontRes.medium,
                                  fontSize: 12,
                                  color: ColorRes.silverChalice),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            user?.user?.msgCount == 0
                                ? const SizedBox(
                                    height: 25,
                                    width: 25,
                                  )
                                : Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                        gradient: StyleRes.linearGradient,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: Text(
                                      user?.user?.msgCount.toString() ?? '',
                                      style: const TextStyle(
                                          fontFamily: FontRes.bold,
                                          fontSize: 12,
                                          color: ColorRes.white),
                                    ),
                                  )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
