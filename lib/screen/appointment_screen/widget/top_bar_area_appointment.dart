import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/appointment_screen/appointment_screen_controller.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TopBarAreaAppointment extends StatelessWidget {
  final AppointmentScreenController controller;

  const TopBarAreaAppointment({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: ColorRes.whiteSmoke,
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Text(
              S.current.appointments.toUpperCase(),
              style: const TextStyle(
                color: ColorRes.charcoalGrey,
                fontSize: 17,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: controller.onAppointmentBoxTap,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorRes.battleshipGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      AssetRes.icCalender,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GetBuilder(
                        id: kAppointmentDateChange,
                        init: controller,
                        builder: (context) {
                          return Text(
                            "${DateFormat(mmmm).format(DateTime(controller.year, controller.month))} ${controller.year}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: FontRes.semiBold,
                                color: ColorRes.tuftsBlue),
                          );
                        }),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
