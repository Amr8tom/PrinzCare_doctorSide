import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/wallet/payout_history.dart';
import 'package:doctor_flutter/screen/payouts_history_screen/payouts_history_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayoutHistoryScreen extends StatelessWidget {
  const PayoutHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PayoutsHistoryScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: S.current.payoutHistory),
          Expanded(
            child: GetBuilder(
              init: controller,
              builder: (context) {
                return controller.isLoading
                    ? CustomUi.loaderWidget()
                    : controller.payoutData == null ||
                            controller.payoutData!.isEmpty
                        ? CustomUi.noData(
                            message:
                                '${S.current.no} ${S.current.payoutHistory}')
                        : SafeArea(
                            top: false,
                            child: ListView.builder(
                              itemCount: controller.payoutData?.length ?? 0,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                PayoutHistoryData? data =
                                    controller.payoutData?[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 1.5),
                                  padding: const EdgeInsets.all(10),
                                  color: ColorRes.whiteSmoke,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data?.requestNumber ?? '',
                                                    style: const TextStyle(
                                                        color:
                                                            ColorRes.tuftsBlue,
                                                        fontFamily:
                                                            FontRes.semiBold,
                                                        fontSize: 16),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    (data?.createdAt ??
                                                            createdDate)
                                                        .dateParse(
                                                            ddMmmmYyyyHhMmA),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            ColorRes.davyGrey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "$dollar${data?.amount ?? '0'}",
                                                  style: const TextStyle(
                                                      fontFamily: FontRes.bold,
                                                      fontSize: 18,
                                                      color: ColorRes.davyGrey),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 5,
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                    color: (data?.status == 0
                                                            ? ColorRes
                                                                .mangoOrange
                                                            : data?.status == 1
                                                                ? ColorRes
                                                                    .irishGreen
                                                                : ColorRes
                                                                    .lightRed)
                                                        .withOpacity(0.15),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    data?.status == 0
                                                        ? S.current.pending
                                                        : data?.status == 1
                                                            ? S.current.complete
                                                            : S.current.reject,
                                                    style: TextStyle(
                                                        color: data?.status == 0
                                                            ? ColorRes
                                                                .mangoOrange
                                                            : data?.status == 1
                                                                ? ColorRes
                                                                    .irishGreen
                                                                : ColorRes
                                                                    .lightRed,
                                                        fontFamily:
                                                            FontRes.medium),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
              },
            ),
          )
        ],
      ),
    );
  }
}
