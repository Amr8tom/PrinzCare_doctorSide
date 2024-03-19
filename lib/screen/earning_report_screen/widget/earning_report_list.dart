import 'package:doctor_flutter/model/wallet/earning_history.dart';
import 'package:doctor_flutter/screen/earning_report_screen/earning_report_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarningReportList extends StatelessWidget {
  final EarningReportScreenController controller;

  const EarningReportList({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder(
        init: controller,
        builder: (context) {
          return SafeArea(
            top: false,
            child: ListView.builder(
              itemCount: controller.earningData?.length ?? 0,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                EarningHistoryData? data = controller.earningData?[index];
                return Container(
                  color: ColorRes.whiteSmoke,
                  margin: const EdgeInsets.symmetric(vertical: 1.2),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?.earningNumber ?? '',
                              style: const TextStyle(
                                  color: ColorRes.davyGrey,
                                  fontSize: 14,
                                  fontFamily: FontRes.semiBold),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              (data?.createdAt ?? createdDate)
                                  .dateParse(eeeDdMmmYyyyHhMmA),
                              style: const TextStyle(
                                  color: ColorRes.davyGrey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$dollar${data?.amount ?? 0}",
                        style: const TextStyle(
                            fontFamily: FontRes.bold,
                            fontSize: 20,
                            color: ColorRes.davyGrey),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
