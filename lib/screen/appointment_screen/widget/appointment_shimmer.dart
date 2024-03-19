import 'package:doctor_flutter/screen/shimmer_screen/shimmer_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentShimmer extends StatelessWidget {
  const AppointmentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: ColorRes.whiteSmoke,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(7),
        child: Row(
          children: [
            ShimmerScreen.rectangular(
              height: 90,
              width: 95,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerScreen.rectangular(
                  height: 20,
                  width: Get.width / 2.7,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 10,
                ),
                ShimmerScreen.rectangular(
                  height: 20,
                  width: Get.width / 2.7,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
            const Spacer(),
            ShimmerScreen.rectangular(
                height: 30,
                width: 70,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))
          ],
        ),
      ),
    );
  }
}
