import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/earning_report_screen/Widget/chart_box.dart';
import 'package:doctor_flutter/screen/earning_report_screen/Widget/earning_report_list.dart';
import 'package:doctor_flutter/screen/earning_report_screen/earning_report_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarningReportScreen extends StatelessWidget {
  const EarningReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EarningReportScreenController());
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          TopBarArea(title: S.current.earningReport),
          GetBuilder(
            init: controller,
            builder: (context) {
              return Row(
                children: [
                  _earningTopCard(
                      title1:
                          '$dollar${controller.doctorData?.lifetimeEarnings ?? 0}',
                      category: S.current.totalEarnings),
                  _earningTopCard(
                      title1:
                          controller.doctorData?.totalPatientsCured?.number ??
                              '0',
                      category: S.current.totalOrders),
                ],
              );
            },
          ),
          ChartBox(controller: controller),
          EarningReportList(controller: controller)
        ],
      ),
    );
  }

  Widget _earningTopCard({required String title1, required String category}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding:
            const EdgeInsets.only(left: 15, right: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorRes.whiteSmoke),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: const TextStyle(
                  color: ColorRes.havelockBlue,
                  fontFamily: FontRes.extraBold,
                  fontSize: 21),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              category,
              style: const TextStyle(
                  fontSize: 14,
                  color: ColorRes.davyGrey,
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 0.5),
            )
          ],
        ),
      ),
    );
  }
}
