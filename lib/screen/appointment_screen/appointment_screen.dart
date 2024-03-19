import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/appointment_screen/appointment_screen_controller.dart';
import 'package:doctor_flutter/screen/appointment_screen/widget/appointment_card.dart';
import 'package:doctor_flutter/screen/appointment_screen/widget/qr_scanner.dart';
import 'package:doctor_flutter/screen/appointment_screen/widget/top_bar_area_appointment.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AppointmentScreenController();
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarAreaAppointment(controller: controller),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder(
                    id: kAppointmentDateChange,
                    init: controller,
                    builder: (context) {
                      return TableCalendar(
                        firstDay:
                            DateTime.utc(controller.year, controller.month, 1),
                        lastDay: DateTime.utc(
                            controller.year,
                            controller.month,
                            DateTime.utc(
                                    controller.year, controller.month + 1, 0)
                                .day),
                        focusedDay: DateTime.utc(
                            controller.year, controller.month, controller.day),
                        currentDay: DateTime.utc(
                            controller.year, controller.month, controller.day),
                        pageJumpingEnabled: true,
                        pageAnimationCurve: Curves.linearToEaseOut,
                        pageAnimationEnabled: true,
                        pageAnimationDuration: const Duration(seconds: 1),
                        calendarFormat: CalendarFormat.week,
                        headerVisible: false,
                        shouldFillViewport: false,
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            return _dateBuilder(
                              controller: controller,
                              day: day,
                            );
                          },
                          todayBuilder: (context, day, focusedDay) {
                            return _dateBuilder(
                                controller: controller,
                                day: day,
                                containerColor: ColorRes.havelockBlue,
                                elevation: 3);
                          },
                          disabledBuilder: (context, day, focusedDay) {
                            return _dateBuilder(
                                controller: controller,
                                day: day,
                                containerColor: ColorRes.whiteSmoke);
                          },
                        ),
                        daysOfWeekVisible: false,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder(
                    init: controller,
                    builder: (context) {
                      return Text(
                        "${controller.acceptAppointment?.length ?? 0} ${S.current.appointments}",
                        style: const TextStyle(
                            fontSize: 17,
                            fontFamily: FontRes.medium,
                            color: ColorRes.darkJungleGreen),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: ColorRes.whiteSmoke,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: controller.searchController,
                      onChanged: controller.onSearchChanged,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        hintText: S.current.search,
                        hintStyle: const TextStyle(
                          color: ColorRes.nobel,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: FontRes.medium,
                        fontSize: 15,
                        color: ColorRes.charcoalGrey,
                      ),
                      cursorHeight: 15,
                      cursorColor: ColorRes.charcoalGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder(
                    init: controller,
                    builder: (context) {
                      return AppointmentCard(
                        controller: controller,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     CommonFun.doctorBanned(() {
      //       Get.dialog(const QRViewExample(), barrierDismissible: true);
      //     });
      //   },
      //   backgroundColor: ColorRes.tuftsBlue,
      //   child: Image.asset(
      //     AssetRes.scan,
      //     width: 25,
      //     color: ColorRes.white,
      //   ),
      // ),
    );
  }

  Widget _dateBuilder({
    required AppointmentScreenController controller,
    required DateTime day,
    Color containerColor = ColorRes.softPeach,
    double elevation = 0,
  }) {
    return InkWell(
      onTap: () {
        controller.onSelectedDateClick(day.year, day.month, day.day);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
        elevation: elevation,
        shadowColor: ColorRes.black.withOpacity(0.50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(),
              Text(
                DateFormat(ee).format(day).toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 0.5,
                  fontFamily: FontRes.medium,
                  color: containerColor == ColorRes.whiteSmoke
                      ? ColorRes.nobel
                      : containerColor == ColorRes.havelockBlue
                          ? ColorRes.white
                          : ColorRes.charcoalGrey,
                ),
              ),
              Text(
                day.day.toString(),
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: FontRes.semiBold,
                  color: containerColor == ColorRes.whiteSmoke
                      ? ColorRes.nobel
                      : containerColor == ColorRes.havelockBlue
                          ? ColorRes.white
                          : ColorRes.charcoalGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
