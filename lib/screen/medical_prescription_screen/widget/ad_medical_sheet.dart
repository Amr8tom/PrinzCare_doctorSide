import 'package:doctor_flutter/common/doctor_profile_text_filed.dart';
import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/medical_prescription_screen/medical_prescription_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdMedicalSheet extends StatelessWidget {
  final MedicalPrescriptionScreenController controller;
  final int type;

  const AdMedicalSheet({Key? key, required this.controller, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppBar().preferredSize.height),
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Text(
                  S.current.addMedicine,
                  style: const TextStyle(
                    fontFamily: FontRes.extraBold,
                    color: ColorRes.charcoalGrey,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 37,
                    width: 37,
                    decoration: const BoxDecoration(
                        color: ColorRes.iceberg, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.close_rounded,
                      color: ColorRes.darkSkyBlue,
                      size: 22,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder(
                    init: controller,
                    builder: (context) {
                      return DoctorProfileTextField(
                        isExample: false,
                        title: S.current.medicalName,
                        exampleTitle: "",
                        hintTitle: S.current.medicine,
                        controller: controller.medicineController,
                        hintTextColor: controller.isTitleError == true
                            ? ColorRes.bittersweet
                            : ColorRes.silverChalice,
                        errorColor: controller.isTitleError == true
                            ? ColorRes.bittersweet.withOpacity(0.2)
                            : ColorRes.whiteSmoke,
                      );
                    },
                  ),
                  GetBuilder(
                      init: controller,
                      builder: (context) {
                        return DoctorProfileTextField(
                            isExample: false,
                            title: S.current.quantityEtc,
                            exampleTitle: "",
                            hintTitle: S.current.totalUnits,
                            textInputType: TextInputType.number,
                            hintTextColor: controller.isQuantityError == true
                                ? ColorRes.bittersweet
                                : ColorRes.silverChalice,
                            errorColor: controller.isQuantityError == true
                                ? ColorRes.bittersweet.withOpacity(0.2)
                                : ColorRes.whiteSmoke,
                            controller: controller.quantityController);
                      }),
                  GetBuilder(
                      init: controller,
                      builder: (context) {
                        return DoctorProfileTextField(
                            isExpand: true,
                            textFieldHeight: 100,
                            title: S.current.dosageDetailsEtc,
                            exampleTitle: S.current.timingUnitEtc,
                            hintTitle: S.current.writeHere,
                            hintTextColor: controller.isDosageError == true
                                ? ColorRes.bittersweet
                                : ColorRes.silverChalice,
                            errorColor: controller.isDosageError == true
                                ? ColorRes.bittersweet.withOpacity(0.2)
                                : ColorRes.whiteSmoke,
                            controller: controller.doseController);
                      }),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: GetBuilder(
                      init: controller,
                      builder: (controller) {
                        return Wrap(
                          children: List.generate(
                            controller.mealList.length,
                            (index) {
                              return InkWell(
                                onTap: () => controller.onMealTap(index),
                                child: FittedBox(
                                  child: Container(
                                    height: 40,
                                    margin: const EdgeInsets.only(
                                        right: 5, bottom: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: index == controller.selectedMeal
                                          ? ColorRes.tuftsBlue
                                          : ColorRes.softPeach,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.mealList[index],
                                      style: TextStyle(
                                        color: index == controller.selectedMeal
                                            ? ColorRes.white
                                            : ColorRes.charcoalGrey,
                                        fontFamily: FontRes.semiBold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GetBuilder(
                      init: controller,
                      builder: (context) {
                        return Container(
                          height: 100,
                          color: controller.isExtraNotesError
                              ? ColorRes.bittersweet.withOpacity(0.2)
                              : ColorRes.snowDrift,
                          child: TextField(
                            controller: controller.noteController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              hintText: S.current.extraNotes,
                              hintStyle: TextStyle(
                                fontFamily: FontRes.medium,
                                color: controller.isExtraNotesError
                                    ? ColorRes.bittersweet
                                    : ColorRes.silverChalice,
                              ),
                            ),
                            style: const TextStyle(
                                fontFamily: FontRes.semiBold,
                                color: ColorRes.charcoalGrey,
                                fontSize: 15),
                            expands: true,
                            maxLines: null,
                            minLines: null,
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: TextButtonCustom(
                onPressed: () => controller.onSubmitClick(type),
                title: S.current.submit,
                titleColor: ColorRes.white,
                backgroundColor: ColorRes.darkSkyBlue),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
