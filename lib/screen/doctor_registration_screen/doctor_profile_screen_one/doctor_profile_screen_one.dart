import 'package:doctor_flutter/common/doctor_profile_text_filed.dart';
import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_one/doctor_profile_screen_one_controller.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfileScreenOne extends StatelessWidget {
  const DoctorProfileScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorProfileScreenOneController());
    return Scaffold(
      body: GestureDetector(
        onTap: controller.unFocusFiled,
        child: Column(
          children: [
            TopBarArea(title: S.current.doctorRegistration),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: ColorRes.white,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(30),
                                  dashPattern: const [5, 2],
                                  color: ColorRes.nobel,
                                  child: InkWell(
                                    onTap: controller.pickImage,
                                    child: GetBuilder(
                                      init: controller,
                                      builder: (context) {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                          child: Stack(
                                            children: [
                                              controller.profileImage != null
                                                  ? Image(
                                                      image: FileImage(
                                                          controller
                                                              .profileImage!),
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : controller.netWorkProfileImage !=
                                                          null
                                                      ? Image(
                                                          image: NetworkImage(
                                                            '${ConstRes.itemBaseURL}${controller.netWorkProfileImage}',
                                                          ),
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Container(
                                                          color: ColorRes
                                                              .softPeach,
                                                        ),
                                              const Center(
                                                child: Icon(
                                                  Icons.add_circle,
                                                  color: ColorRes.nobel,
                                                  size: 35,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GetBuilder(
                                init: controller,
                                builder: (controller) {
                                  return Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.userData?.name ??
                                              S.current.unKnown,
                                          style: const TextStyle(
                                            fontFamily: FontRes.extraBold,
                                            fontSize: 19,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AssetRes.stethoscope,
                                              width: 25,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                controller.designationController
                                                        .text.isNotEmpty
                                                    ? controller
                                                        .designationController
                                                        .text
                                                    : controller.userData
                                                            ?.designation ??
                                                        S.current
                                                            .addYourDesignation,
                                                style: const TextStyle(
                                                  color: ColorRes.havelockBlue,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          controller.degreeController.text
                                                  .isNotEmpty
                                              ? controller.degreeController.text
                                              : controller.userData?.degrees ??
                                                  S.current.addYourDegreesEtc,
                                          style: const TextStyle(
                                              fontSize: 14.5,
                                              color: ColorRes.mediumGrey),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: ColorRes.mediumGrey,
                            thickness: 0.3,
                          ),
                        ],
                      ),
                    ),
                    GetBuilder(
                      init: controller,
                      builder: (context) {
                        return DoctorProfileTextField(
                          isExample: false,
                          isExpand: false,
                          controller: controller.designationController,
                          title: S.current.designationEtc,
                          exampleTitle: "",
                          hintTitle: S.current.enterDesignation,
                          onChange: controller.onDesignationChange,
                          focusNode: controller.designationFocusNode,
                        );
                      },
                    ),
                    GetBuilder(
                      init: controller,
                      builder: (context) {
                        return DoctorProfileTextField(
                          isExpand: true,
                          controller: controller.degreeController,
                          title: S.current.enterYourDegreesEtc,
                          exampleTitle: S.current.exampleMsEtc,
                          hintTitle: S.current.enterDegrees,
                          textFieldHeight: 100,
                          onChange: controller.onDegreeChange,
                          focusNode: controller.degreeFocusNode,
                        );
                      },
                    ),
                    GetBuilder(
                      init: controller,
                      builder: (context) {
                        return DoctorProfileTextField(
                          controller: controller.languageController,
                          title: S.current.languagesYouSpeakEtc,
                          exampleTitle: S.current.exampleLanguage,
                          hintTitle: S.current.enterLanguages,
                          focusNode: controller.languageFocusNode,
                        );
                      },
                    ),
                    GetBuilder(
                      init: controller,
                      builder: (context) {
                        return DoctorProfileTextField(
                          isExample: false,
                          controller: controller.experienceController,
                          title: S.current.yearsOfExperience,
                          exampleTitle: "",
                          hintTitle: S.current.numberOfYears,
                          textInputType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          focusNode: controller.experienceFocusNode,
                        );
                      },
                    ),
                    GetBuilder(
                      init: controller,
                      builder: (context) {
                        return DoctorProfileTextField(
                          isDollar: true,
                          controller: controller.feesController,
                          title: S.current.consultationFee,
                          exampleTitle: S.current.youCanChangeThisEtc,
                          hintTitle: "00",
                          textInputType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          focusNode: controller.feesFocusNode,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DoctorRegButton(
              onTap: controller.updateDoctorDetailsApiCall,
              title: S.current.continueText,
            )
          ],
        ),
      ),
    );
  }
}
