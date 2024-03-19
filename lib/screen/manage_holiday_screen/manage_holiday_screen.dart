import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/settings_filed_top_bar.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/manage_holiday_screen/manage_holiday_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ManageHolidayScreen extends StatelessWidget {
  const ManageHolidayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageHolidayScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: S.current.manageHolidays),
          SettingsFiledTopBar(
              title1: S.current.addYourHolidaysHere,
              title2: S.current.onThoseDaysPatientsEtc),
          GetBuilder(
            init: controller,
            builder: (context) {
              return Expanded(
                child: controller.isLoading
                    ? CustomUi.loaderWidget()
                    : _manageHolidays(controller),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onDatePickerOpen,
        backgroundColor: ColorRes.havelockBlue,
        child: const Icon(
          Icons.add_rounded,
          color: ColorRes.white,
          size: 35,
        ),
      ),
    );
  }

  Widget _manageHolidays(ManageHolidayScreenController controller) {
    return controller.registrationData == null ||
            controller.registrationData!.isEmpty
        ? CustomUi.noData(message: S.current.noHolidayData)
        : ListView.builder(
            itemCount: controller.registrationData?.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              Holidays? holidays = controller.registrationData?[index];
              controller.registrationData?.sort(
                (a, b) {
                  DateTime date1 =
                      DateFormat(yyyyMmDd, 'en').parse(a.date ?? '');
                  DateTime date2 =
                      DateFormat(yyyyMmDd, 'en').parse(b.date ?? '');
                  return date1.compareTo(date2);
                },
              );
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 13,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 2,
                ),
                color: ColorRes.whiteSmoke,
                child: Row(
                  children: [
                    Text(
                      CommonFun.dateFormat(holidays?.date ?? '2023-02-01', 1),
                      style: const TextStyle(color: ColorRes.davyGrey),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => controller.onHolidayDeleteTap(holidays),
                      child: const Icon(
                        Icons.delete,
                        size: 20,
                        color: ColorRes.tuftsBlue,
                      ),
                    )
                  ],
                ),
              );
            },
          );
  }
}
