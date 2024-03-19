import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/model/medical_prescription.dart';
import 'package:doctor_flutter/screen/medical_prescription_screen/medical_prescription_screen_controller.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalPrescriptionScreen extends StatelessWidget {
  const MedicalPrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedicalPrescriptionScreenController());
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          TopBarArea(title: S.current.medicalPrescription),
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _simpleText(
                      title: S.current.createPrescriptionFor,
                      fontFamily: FontRes.regular),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: ColorRes.whiteSmoke,
                        borderRadius: BorderRadius.circular(15)),
                    child: GetBuilder(
                        init: controller,
                        builder: (context) {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${ConstRes.itemBaseURL}${controller.appointmentData?.patientId == null ? controller.appointmentData?.user?.profileImage : controller.appointmentData?.patient?.image}',
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, error, stackTrace) {
                                    return CustomUi.userPlaceHolder(
                                        male: controller.appointmentData?.user
                                                ?.gender ??
                                            0,
                                        height: 70);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (controller.appointmentData?.patientId ==
                                                  null
                                              ? controller.appointmentData?.user
                                                  ?.fullname
                                              : controller.appointmentData
                                                  ?.patient?.fullname) ??
                                          S.current.unKnown,
                                      style: const TextStyle(
                                        color: ColorRes.charcoalGrey,
                                        fontFamily: FontRes.extraBold,
                                        fontSize: 18,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      ageAndGenderFormat(
                                          controller.appointmentData),
                                      style: const TextStyle(
                                        color: ColorRes.battleshipGrey,
                                        fontFamily: FontRes.medium,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder(
                    init: controller,
                    builder: (context) {
                      return controller.medicines.isEmpty
                          ? const SizedBox()
                          : ListView.builder(
                              itemCount: controller.medicines.length,
                              primary: false,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                AddMedicine addMedicine =
                                    controller.medicines[index];
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  color: index % 2 == 0
                                      ? ColorRes.whiteSmoke
                                      : ColorRes.snowDrift,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              addMedicine.title ?? '',
                                              style: const TextStyle(
                                                  fontFamily: FontRes.semiBold,
                                                  color: ColorRes.charcoalGrey,
                                                  fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              addMedicine.mealTime == 0
                                                  ? S.current.afterMeal
                                                  : S.current.beforeMeal,
                                              style: const TextStyle(
                                                  fontFamily: FontRes.semiBold,
                                                  color:
                                                      ColorRes.battleshipGrey,
                                                  fontSize: 13),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              addMedicine.dosage ?? '',
                                              style: const TextStyle(
                                                  color:
                                                      ColorRes.battleshipGrey,
                                                  fontSize: 13),
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Visibility(
                                              visible:
                                                  addMedicine.notes!.isEmpty
                                                      ? false
                                                      : true,
                                              child: Text(
                                                '${S.current.notes} :- ${addMedicine.notes ?? ''}',
                                                style: const TextStyle(
                                                    color: ColorRes.tuftsBlue,
                                                    fontSize: 13),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${addMedicine.quantity ?? ''}',
                                            style: const TextStyle(
                                                fontFamily: FontRes.bold,
                                                color: ColorRes.charcoalGrey,
                                                fontSize: 24),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          PopupMenuButton(
                                            initialValue:
                                                controller.initialValue,
                                            padding: const EdgeInsets.all(0),
                                            icon: Image.asset(
                                              AssetRes.icMore,
                                              width: 20,
                                              color: ColorRes.tuftsBlue,
                                            ),
                                            onSelected: (value) {
                                              if (value == 0) {
                                                controller.onMedicineEdit(
                                                    addMedicine, controller);
                                              } else {
                                                controller
                                                    .onDeleteTap(addMedicine);
                                              }
                                            },
                                            itemBuilder:
                                                (BuildContext context) =>
                                                    <PopupMenuEntry>[
                                              PopupMenuItem(
                                                value: 0,
                                                child: Text(
                                                  S.current.edit,
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          FontRes.medium,
                                                      color: ColorRes
                                                          .battleshipGrey),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 1,
                                                child: Text(
                                                  S.current.delete,
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          FontRes.medium,
                                                      color: ColorRes
                                                          .battleshipGrey),
                                                ),
                                              ),
                                            ],
                                            color: ColorRes.whiteSmoke,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                    },
                  ),
                  InkWell(
                    onTap: () => controller.addMedicineTap(controller),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(15),
                      color: ColorRes.whiteSmoke,
                      alignment: Alignment.center,
                      child: Text(
                        S.current.addMedicine,
                        style: const TextStyle(
                            color: ColorRes.tuftsBlue,
                            fontSize: 14,
                            fontFamily: FontRes.semiBold),
                      ),
                    ),
                  ),
                  _simpleText(
                      title: S.current.notes,
                      fontFamily: FontRes.semiBold,
                      color: ColorRes.charcoalGrey),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 120,
                    color: ColorRes.whiteSmoke,
                    child: TextField(
                      controller: controller.extraNoteController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: S.current.writeHere,
                        hintStyle: const TextStyle(
                          fontFamily: FontRes.medium,
                          fontSize: 15,
                          color: ColorRes.nobel,
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 15,
                          color: ColorRes.davyGrey,
                          fontFamily: FontRes.medium),
                      expands: true,
                      minLines: null,
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          DoctorRegButton(
              onTap: () => controller.onContinueTap(
                  controller.appointmentData?.prescription == null ? 0 : 1),
              title: controller.appointmentData?.prescription == null
                  ? S.current.continueText
                  : S.current.edit)
        ],
      ),
    );
  }

  String ageAndGenderFormat(AppointmentData? data) {
    if (data?.patient == null) {
      return "${data?.user?.dob == null ? '0' : CommonFun.calculateAge(data?.user?.dob)} ${S.current.years} : ${data?.user?.gender == 1 ? S.current.male : S.current.feMale}";
    } else {
      return "${data?.patient?.age ?? '0'} ${S.current.years} : ${data?.patient?.gender == 1 ? S.current.male : S.current.feMale}";
    }
  }

  Widget _simpleText(
      {required String title,
      required String fontFamily,
      Color color = ColorRes.battleshipGrey}) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: Directionality.of(Get.context!) == TextDirection.rtl ? 0 : 15,
        bottom: 5,
        right: Directionality.of(Get.context!) == TextDirection.rtl ? 15 : 0,
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 15, color: color, fontFamily: fontFamily),
      ),
    );
  }
}
