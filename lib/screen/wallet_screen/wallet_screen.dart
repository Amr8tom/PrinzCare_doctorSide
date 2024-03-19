import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/wallet/wallet_statement.dart';
import 'package:doctor_flutter/screen/wallet_screen/wallet_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletScreenController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarArea(title: S.current.wallet),
          Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    colors: [ColorRes.crystalBlue, ColorRes.tuftsBlue100],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Row(
                children: [
                  GetBuilder(
                    init: controller,
                    builder: (context) {
                      return Text(
                        "$dollar${controller.doctorData?.wallet ?? 0}",
                        style: const TextStyle(
                            color: ColorRes.white,
                            fontSize: 28,
                            fontFamily: FontRes.light,
                            letterSpacing: 0.5),
                      );
                    },
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: controller.onWithdrawTap,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorRes.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        S.current.withdraw,
                        style: const TextStyle(
                            color: ColorRes.white,
                            fontFamily: FontRes.medium,
                            fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              S.current.statement,
              style: const TextStyle(
                  fontSize: 16, color: ColorRes.darkJungleGreen),
            ),
          ),
          _statements(controller)
        ],
      ),
    );
  }

  Widget _statements(WalletScreenController controller) {
    return Expanded(
      child: SafeArea(
        top: false,
        child: GetBuilder(
          init: controller,
          builder: (context) {
            return
              // controller.isLoading
              //   ? CustomUi.loaderWidget()
              //   : controller.walletData == null ||
              //           controller.walletData!.isEmpty
              //       ? CustomUi.noData()
              //       :
              ListView.builder(
                        itemCount: controller.walletData?.length ?? 2,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          WalletStatementData? data =
                              controller.walletData?[index];
                          return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(vertical: 1),
                            color: data?.crOrDr == 1
                                ? ColorRes.mediumGreen.withOpacity(0.08)
                                : ColorRes.bittersweet.withOpacity(0.08),
                            child: Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: data?.crOrDr == 0
                                        ? ColorRes.bittersweet
                                        : ColorRes.mediumGreen,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    data?.crOrDr == 0
                                        ? Icons.remove_rounded
                                        : Icons.add_rounded,
                                    size: 20,
                                    color: ColorRes.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: Get.width / 2.5,
                                            child: Text(
                                              "${data?.transactionId?.toUpperCase() ?? ''} -",
                                              style: const TextStyle(
                                                  color: ColorRes.davyGrey,
                                                  fontFamily: FontRes.semiBold,
                                                  fontSize: 13,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              (data?.type == 0
                                                      ? S.current.earning
                                                      : data?.type == 1
                                                          ? S.current.commission
                                                          : data?.type == 2
                                                              ? S.current
                                                                  .withdraw
                                                              : data?.type == 3
                                                                  ? S.current
                                                                      .refund
                                                                  : S.current
                                                                      .reject)
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                color: data?.crOrDr == 1
                                                    ? ColorRes.mediumGreen
                                                    : ColorRes.bittersweet,
                                                fontFamily: FontRes.semiBold,
                                                letterSpacing: 0.5,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        (data?.createdAt ?? createdDate)
                                            .dateParse(eeeDdMmmYyyyHhMmA),
                                        style: const TextStyle(
                                            color: ColorRes.davyGrey,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$dollar${data?.amount ?? 0}',
                                  style: const TextStyle(
                                    fontFamily: FontRes.bold,
                                    fontSize: 17,
                                    color: ColorRes.davyGrey,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}
