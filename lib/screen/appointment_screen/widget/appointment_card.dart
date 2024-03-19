import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/screen/accept_reject_screen/accept_reject_screen.dart';
import 'package:doctor_flutter/screen/appointment_screen/appointment_screen_controller.dart';
import 'package:doctor_flutter/screen/appointment_screen/widget/appointment_shimmer.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentScreenController controller;

  const AppointmentCard({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: controller.isLoading
          ? const AppointmentShimmer()
          : controller.filterAppointment == null ||
                  controller.filterAppointment!.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        AssetRes.nodata,
                        width: Get.width / 1.5,
                        height: Get.width / 1.5,
                      ),
        Text(
          "${S.current.noPreviousAppointment}",
          style: const TextStyle(
              fontSize: 17,
              fontFamily: FontRes.medium,
              color: ColorRes.darkJungleGreen),
        )
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: controller.filterAppointment?.length ?? 0,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    AppointmentData? appointmentData =
                        controller.filterAppointment?[index];
                    return InkWell(
                      onTap: () {
                        CommonFun.doctorBanned(() {
                          Get.to(() => const AcceptRejectScreen(),
                              arguments: appointmentData);
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: 1 / 0.27,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 8, right: 8, bottom: 7),
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            color: ColorRes.whiteSmoke,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 0.95,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 0.95,
                                        child: appointmentData
                                                        ?.user?.profileImage ==
                                                    null ||
                                                appointmentData!
                                                    .user!.profileImage!.isEmpty
                                            ? CustomUi.userPlaceHolder(
                                                male: appointmentData
                                                        ?.user?.gender ??
                                                    0)
                                            : CachedNetworkImage(
                                                imageUrl:
                                                    '${ConstRes.itemBaseURL}${appointmentData.user?.profileImage}',
                                                fit: BoxFit.cover,
                                                errorWidget: (context, error,
                                                    stackTrace) {
                                                  return CustomUi
                                                      .userPlaceHolder(
                                                    male: appointmentData
                                                            .user?.gender ??
                                                        0,
                                                  );
                                                },
                                              ),
                                      ),
                                      ClipRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaY: 10, sigmaX: 10),
                                          child: Container(
                                            height: 28,
                                            alignment: Alignment.center,
                                            color:
                                                ColorRes.black.withOpacity(0.3),
                                            child: Text(
                                              CommonFun
                                                  .convert24HoursInto12Hours(
                                                      appointmentData?.time),
                                              style: const TextStyle(
                                                  color: ColorRes.white,
                                                  fontFamily: FontRes.semiBold,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      appointmentData?.user?.fullname ??
                                          S.current.unKnown,
                                      style: const TextStyle(
                                          color: ColorRes.charcoalGrey,
                                          fontFamily: FontRes.extraBold,
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${appointmentData?.user?.dob == null ? '0' : CommonFun.calculateAge(appointmentData?.user?.dob ?? '2001-01-02')} ${S.current.years}: ${appointmentData?.user?.gender == 1 ? S.current.male : S.current.feMale}",
                                      style: const TextStyle(
                                          fontFamily: FontRes.medium,
                                          color: ColorRes.battleshipGrey,
                                          fontSize: 14.5,
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  CommonFun.doctorBanned(() {
                                    launchUrl(Uri.parse(
                                        'tel:${appointmentData?.user?.identity}'));
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: ColorRes.greenWhite,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    S.current.callNow,
                                    style: const TextStyle(
                                      color: ColorRes.tuftsBlue,
                                      fontFamily: FontRes.semiBold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
