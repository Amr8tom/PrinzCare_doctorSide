import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/screen/accept_reject_screen/accept_reject_screen.dart';
import 'package:doctor_flutter/screen/request_screen/widget/request_card.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviousAppointmentScreen extends StatelessWidget {
  final AppointmentData? appointmentData;

  const PreviousAppointmentScreen({Key? key, this.appointmentData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          TopBarArea(
            title: S.current.previousAppointments,
          ),
          UserCard(onViewTap: () {}, appointmentData: appointmentData),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: appointmentData?.previousAppointments == null ||
                    appointmentData!.previousAppointments!.isEmpty
                ? CustomUi.noData(message: S.current.noPreviousAppointment)
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount:
                        appointmentData?.previousAppointments?.length ?? 0,
                    itemBuilder: (context, index) {
                      AppointmentData? data =
                          appointmentData?.previousAppointments?[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        color: ColorRes.whiteSmoke,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data?.appointmentNumber ?? '',
                                    style: const TextStyle(
                                      fontFamily: FontRes.bold,
                                      fontSize: 15,
                                      color: ColorRes.darkJungleGreen,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    (data?.createdAt ?? createdDate)
                                        .dateParse(ddMmmYyyyEeeHhMmA),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: ColorRes.davyGrey,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(
                                  () => const AcceptRejectScreen(),
                                  arguments: data,
                                );
                              },
                              child: Image.asset(
                                AssetRes.icMore,
                                color: ColorRes.tuftsBlue,
                                width: 20,
                                height: 20,
                              ),
                            )
                          ],
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
