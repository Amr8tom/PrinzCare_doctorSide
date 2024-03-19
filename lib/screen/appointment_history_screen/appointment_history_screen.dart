import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/screen/appointment_history_screen/appointment_history_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentHistoryScreen extends StatelessWidget {
  const AppointmentHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentHistoryScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: S.current.appointmentHistory),
          Expanded(
            child: SafeArea(
              top: false,
              child: GetBuilder(
                init: controller,
                builder: (context) {
                  return controller.isLoading
                      ? CustomUi.loaderWidget()
                      : controller.appointmentData == null ||
                              controller.appointmentData!.isEmpty
                          ? CustomUi.noData(
                              message:
                                  '${S.current.no} ${S.current.appointmentHistory}')
                          : ListView.builder(
                              controller: controller.scrollController,
                              itemCount:
                                  controller.appointmentData?.length ?? 0,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                AppointmentData? appointmentData =
                                    controller.appointmentData?[index];
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          controller.onAppointmentCardTap(
                                              appointmentData),
                                      child: Container(
                                        padding: const EdgeInsets.all(7),
                                        margin: const EdgeInsets.only(
                                          top: 5,
                                          left: 15,
                                          right: 15,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: ColorRes.whiteSmoke,
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: appointmentData?.user
                                                              ?.profileImage ==
                                                          null ||
                                                      appointmentData!.user!
                                                          .profileImage!.isEmpty
                                                  ? CustomUi.userPlaceHolder(
                                                      height: 70,
                                                      male: appointmentData
                                                              ?.user?.gender ??
                                                          0,
                                                    )
                                                  : CachedNetworkImage(
                                                      imageUrl:
                                                          '${ConstRes.itemBaseURL}${appointmentData.user?.profileImage}',
                                                      height: 70,
                                                      width: 70,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                          error, stackTrace) {
                                                        return CustomUi
                                                            .userPlaceHolder(
                                                          height: 70,
                                                          male: appointmentData
                                                                  .user
                                                                  ?.gender ??
                                                              0,
                                                        );
                                                      },
                                                    ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    appointmentData
                                                            ?.user?.fullname ??
                                                        S.current.unKnown,
                                                    style: const TextStyle(
                                                        color: ColorRes
                                                            .charcoalGrey,
                                                        fontFamily:
                                                            FontRes.extraBold,
                                                        fontSize: 18,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "${appointmentData?.user?.dob == null ? '0' : CommonFun.calculateAge(appointmentData?.user?.dob ?? '')} ${S.current.years}: ${appointmentData?.user?.gender == 1 ? S.current.male : S.current.feMale}",
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            FontRes.medium,
                                                        color: ColorRes
                                                            .battleshipGrey,
                                                        fontSize: 13,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    // (appointmentData
                                                    //             ?.createdAt ??
                                                    //         createdDate)
                                                    //     .dateParse(
                                                    //         ddMmmYyyyEeeHhMmA),

                                                    '${(appointmentData?.date ?? '').appointmentDate} ${(appointmentData?.time ?? '').appointmentTime}',
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            FontRes.medium,
                                                        color: ColorRes
                                                            .battleshipGrey,
                                                        fontSize: 13,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: (appointmentData?.status == 0
                                                ? ColorRes.havelockBlue
                                                : appointmentData?.status == 1
                                                    ? ColorRes.mangoOrange
                                                    : appointmentData?.status ==
                                                            2
                                                        ? ColorRes.mediumGreen
                                                        : appointmentData
                                                                    ?.status ==
                                                                3
                                                            ? ColorRes
                                                                .charcoalGrey
                                                            : ColorRes.lightRed)
                                            .withOpacity(0.2),
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          bottom: Radius.circular(15),
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(right: 15),
                                      margin: const EdgeInsets.only(
                                        bottom: 5,
                                        left: 15,
                                        right: 15,
                                      ),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        appointmentData?.status == 0
                                            ? S.current.waitingForConfirmation
                                            : appointmentData?.status == 1
                                                ? S.current.accepted
                                                : appointmentData?.status == 2
                                                    ? S.current.completed
                                                    : appointmentData?.status ==
                                                            3
                                                        ? S.current.declined
                                                        : S.current.cancelled,
                                        style: TextStyle(
                                          color: appointmentData?.status == 0
                                              ? ColorRes.havelockBlue
                                              : appointmentData?.status == 1
                                                  ? ColorRes.mangoOrange
                                                  : appointmentData?.status == 2
                                                      ? ColorRes.mediumGreen
                                                      : appointmentData
                                                                  ?.status ==
                                                              3
                                                          ? ColorRes
                                                              .charcoalGrey
                                                          : ColorRes.lightRed,
                                          fontSize: 15,
                                          fontFamily: FontRes.medium,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
