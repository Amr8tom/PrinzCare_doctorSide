import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment_slot/appointment_slot.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/appointment_slots_screen/widget/add_slot_dialog.dart';
import 'package:doctor_flutter/screen/message_chat_screen/widget/message_chat_top_bar.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:get/get.dart';

// 1 monday
// List<AppointmentSlot> appointmentSlot = [
//   AppointmentSlot(S.current.monday, []),
//   AppointmentSlot(S.current.tuesday, []),
//   AppointmentSlot(S.current.wednesday, []),
//   AppointmentSlot(S.current.thursday, []),
//   AppointmentSlot(S.current.friday, []),
//   AppointmentSlot(S.current.saturday, []),
//   AppointmentSlot(S.current.sunday, [])
// ];

class AppointmentSlotsScreenController extends GetxController {
  // List<AppointmentSlot> appointmentSlot = [
  //   AppointmentSlot(S.current.monday, [
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //   ]),
  //   AppointmentSlot(S.current.tuesday, [
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //   ]),
  //   AppointmentSlot(S.current.wednesday, [
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //   ]),
  //   AppointmentSlot(S.current.thursday, [
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //   ]),
  //   AppointmentSlot(S.current.friday, [
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //   ]),
  //   AppointmentSlot(S.current.saturday, [;
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //     Slots(id: 23,doctorId:23,time: "20:3" ,bookingLimit: 2,weekday: 2),
  //   ]),
  //   AppointmentSlot(S.current.sunday, [])
  // ];
  List<AppointmentSlot> appointmentSlot = [
    AppointmentSlot(S.current.monday, []),
    AppointmentSlot(S.current.tuesday, []),
    AppointmentSlot(S.current.wednesday, []),
    AppointmentSlot(S.current.thursday, []),
    AppointmentSlot(S.current.friday, []),
    AppointmentSlot(S.current.saturday, []),
    AppointmentSlot(S.current.sunday, [])
  ];


  bool isLoading = false;
  DoctorData? registrationData;
  final now = DateTime.now();

  @override
  void onInit() {
    fetchDoctorApiCall();
    super.onInit();
  }

  void fetchDoctorApiCall() {
    isLoading = true;
    ApiService.instance.fetchMyDoctorProfile().then((value) {
      registrationData = value.data;
      registrationData?.slots?.forEach((element) {
        appointmentSlot[(element.weekday! - 1)].time.add(element);
      });
      isLoading = false;
      update();
    });
  }

  void addBtnTap(int weekIndex) {
    Get.dialog(AddSlotDialog(
      daysIndex: weekIndex,
      appointmentSlot: appointmentSlot,
    )).then((value) {
      update();
    });
  }

  void deleteSlot(Slots? time) {
    Get.dialog(ConfirmationDialog(
      title: S.current.deleteSlot,
      title2: S.current.ifYouDeleteTheSlotAlsoDeleteYourPatientApp,
      positiveText: S.current.delete,
      aspectRatio: 1.7,
      onPositiveBtn: () {
        Get.back();
        CustomUi.loader();
        ApiService.instance
            .deleteAppointmentSlot(slotId: time?.id)
            .then((value) {
          Get.back();
          appointmentSlot[time!.weekday! - 1].time.removeWhere((element) {
            return element?.time == time.time;
          });
          update([kAppointmentDelete]);
        });
      },
    ));
  }
}
