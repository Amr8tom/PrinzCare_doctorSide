import 'package:doctor_flutter/screen/video_preview_screen/video_preview_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatelessWidget {
  const VideoPreviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoPreviewScreenController());
    return Scaffold(
      backgroundColor: ColorRes.black,
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder(
                init: controller,
                builder: (context) {
                  return Center(
                    child: controller.videoPlayerController.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: controller
                                .videoPlayerController.value.aspectRatio,
                            child:
                                VideoPlayer(controller.videoPlayerController))
                        : Container(),
                  );
                }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(left: 20, top: 10),
                    decoration: BoxDecoration(
                      color: ColorRes.havelockBlue.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: ColorRes.white,
                      size: 18,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: controller.onPlayPauseTap,
                  splashColor: ColorRes.transparent,
                  highlightColor: ColorRes.transparent,
                  child: Container(
                    height: Get.height / 1.5,
                    alignment: Alignment.center,
                    child: ValueListenableBuilder(
                      valueListenable: controller.videoPlayerController,
                      builder: (context, value, child) => AnimatedOpacity(
                        opacity:
                            controller.videoPlayerController.value.isPlaying ==
                                    true
                                ? 0.0
                                : 1.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                        child: Icon(
                          controller.videoPlayerController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: ColorRes.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ValueListenableBuilder(
                    valueListenable: controller.videoPlayerController,
                    builder: (context, value, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${controller.printDuration(controller.videoPlayerController.value.position)} / ${controller.printDuration(controller.videoPlayerController.value.duration)}',
                          style: const TextStyle(
                              color: ColorRes.white,
                              fontFamily: FontRes.semiBold,
                              letterSpacing: 0.5),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        VideoProgressIndicator(
                          controller.videoPlayerController,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                              backgroundColor: ColorRes.white,
                              playedColor: ColorRes.tuftsBlue),
                          padding: const EdgeInsets.only(bottom: 15, top: 3),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
