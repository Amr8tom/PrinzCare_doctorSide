import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment_slot/appointment_slot.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddSlotDialog extends StatefulWidget {
  final int daysIndex;
  final List<AppointmentSlot> appointmentSlot;

  const AddSlotDialog(
      {super.key, required this.daysIndex, required this.appointmentSlot});

  @override
  State<AddSlotDialog> createState() => _AddSlotDialogState();
}

class _AddSlotDialogState extends State<AddSlotDialog> {
  String time = DateFormat('hh:mm a').format(DateTime.now());
  String slotTime = DateFormat('HHmm', 'en').format(DateTime.now());
  String slotEndTime = DateFormat('HHmm', 'en').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour+1,
      DateTime.now().minute));

  String slotLimit = '1';
  String slotDuration = '5';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorRes.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: AspectRatio(
        aspectRatio: 0.6,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                '${S.current.addSlot} ( ${CommonFun.getDays(widget.daysIndex)} )',
                style: const TextStyle(
                  fontFamily: FontRes.bold,
                  fontSize: 18,
                  color: ColorRes.tuftsBlue,
                ),
              ),
              const Spacer(),
              Text(
                S.of(context).selectTime,
                style: const TextStyle(
                  fontFamily: FontRes.medium,
                  fontSize: 15,
                  color: ColorRes.davyGrey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    if (value != null) {
                      DateTime now = DateTime.now();
                      time = DateFormat('hh:mm a', 'en').format(DateTime(
                          now.year,
                          now.month,
                          now.day,
                          value.hour,
                          value.minute));
                      slotTime = DateFormat('HHmm', 'en').format(DateTime(
                          now.year,
                          now.month,
                          now.day,
                          value.hour,
                          value.minute));
                      setState(() {});
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      color: ColorRes.silverChalice.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Image.asset(
                          AssetRes.icCalender,
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                              fontFamily: FontRes.semiBold,
                              fontSize: 15,
                              color: ColorRes.smokeyGrey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    if (value != null) {
                      DateTime now = DateTime.now();
                      endTime = DateFormat('hh:mm a', 'en').format(DateTime(
                          now.year,
                          now.month,
                          now.day,
                          value.hour,
                          value.minute));
                      slotEndTime = DateFormat('HHmm', 'en').format(DateTime(
                          now.year,
                          now.month,
                          now.day,
                          value.hour,
                          value.minute));
                      setState(() {});
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      color: ColorRes.silverChalice.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Image.asset(
                          AssetRes.icCalender,
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          endTime,
                          style: const TextStyle(
                              fontFamily: FontRes.semiBold,
                              fontSize: 15,
                              color: ColorRes.smokeyGrey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                S.of(context).slotLimit,
                style: const TextStyle(
                  fontFamily: FontRes.medium,
                  fontSize: 15,
                  color: ColorRes.davyGrey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: ColorRes.silverChalice.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  isExpanded: true,
                  menuMaxHeight: 150,
                  value: slotLimit,
                  icon: const SizedBox(),
                  elevation: 16,
                  borderRadius: BorderRadius.circular(10),
                  alignment: Alignment.center,
                  style: const TextStyle(
                      fontFamily: FontRes.semiBold,
                      fontSize: 15,
                      color: ColorRes.smokeyGrey),
                  underline: const SizedBox(),
                  onChanged: (String? value) {
                    slotLimit = value ?? '1';
                    setState(() {});
                  },
                  items: CommonFun.getSlotsBookingLimit
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      alignment: Alignment.center,
                      child: Text(
                        value,
                        style: const TextStyle(
                            fontFamily: FontRes.semiBold,
                            fontSize: 15,
                            color: ColorRes.smokeyGrey),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).slotDuration,
                style: const TextStyle(
                  fontFamily: FontRes.medium,
                  fontSize: 15,
                  color: ColorRes.davyGrey,
                ),
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: ColorRes.silverChalice.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  isExpanded: true,
                  menuMaxHeight: 150,
                  value: slotDuration,
                  icon: const SizedBox(),
                  elevation: 16,
                  borderRadius: BorderRadius.circular(10),
                  alignment: Alignment.center,
                  style: const TextStyle(
                      fontFamily: FontRes.semiBold,
                      fontSize: 15,
                      color: ColorRes.smokeyGrey),
                  underline: const SizedBox(),
                  onChanged: (String? value) {
                    slotDuration = value ?? '10';
                    setState(() {});
                  },
                  items: CommonFun.getSlotsDuration
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      alignment: Alignment.center,
                      child: Text(
                        value,
                        style: const TextStyle(
                            fontFamily: FontRes.semiBold,
                            fontSize: 15,
                            color: ColorRes.smokeyGrey),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),

              TextButtonCustom(
                onPressed: () {
                  CustomUi.loader();
                  ApiService.instance
                      .addAppointmentSlots(
                          time: slotTime,
                          endTime: slotEndTime,
                          weekday: widget.daysIndex,
                          bookingLimit: slotLimit,
                      slotDuration:slotDuration
                  )
                      .then((value) {
                    Get.back();
                    Get.back();
                    if (value.status == true) {
                      Slots? s = value.data?.last;
                      widget.appointmentSlot[widget.daysIndex - 1].time.add(s);
                    } else {
                      CustomUi.snackBar(
                          message: value.message,
                          iconData: Icons.laptop_chromebook_rounded);
                    }
                  });
                },
                title: S.current.submit,
                titleColor: ColorRes.white,
                backgroundColor: ColorRes.tuftsBlue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
