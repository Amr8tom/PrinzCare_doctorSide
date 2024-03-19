import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/screen/video_preview_screen/video_preview_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatVideoCard extends StatelessWidget {
  final String? imageUrl;
  final String? time;
  final String? msg;
  final String? videoUrl;
  final EdgeInsets margin;
  final Color imageCardColor;
  final Color imageTextColor;

  const ChatVideoCard(
      {Key? key,
      this.imageUrl,
      this.time,
      this.msg,
      this.videoUrl,
      required this.margin,
      required this.imageCardColor,
      required this.imageTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: imageCardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: margin,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => const VideoPreviewScreen(), arguments: videoUrl);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: Get.width / 1.6,
                    maxHeight: Get.width / 1.6,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: '${ConstRes.itemBaseURL}$imageUrl',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Container();
                      },
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                ),
                const Icon(
                  Icons.play_circle_rounded,
                  color: ColorRes.whiteSmoke,
                  size: 35,
                )
              ],
            ),
          ),
          Visibility(
            visible: msg == null || msg!.isEmpty ? false : true,
            child: Container(
              padding: const EdgeInsets.all(5),
              constraints: BoxConstraints(
                minWidth: Get.width / 2,
                maxWidth: Get.width / 2,
              ),
              child: Text(
                msg ?? '',
                style: TextStyle(
                    fontFamily: FontRes.regular,
                    fontSize: 14,
                    color: imageTextColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
