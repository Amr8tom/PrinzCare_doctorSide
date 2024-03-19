import 'package:doctor_flutter/utils/const_res.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreenController extends GetxController {
  late VideoPlayerController videoPlayerController;
  String videoUrl = Get.arguments;

  @override
  void onInit() {
    videoPlayerController =
        VideoPlayerController.network('${ConstRes.itemBaseURL}$videoUrl')
          ..initialize().then((_) {
            videoPlayerController.play();
            update();
          });
    super.onInit();
  }

  void onPlayPauseTap() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (twoDigits(duration.inHours) == '00') {
      return '$twoDigitMinutes:$twoDigitSeconds';
    }
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
