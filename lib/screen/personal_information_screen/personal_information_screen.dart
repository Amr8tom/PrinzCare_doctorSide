import 'dart:ui';

import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/doctor_profile_text_filed.dart';
import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/personal_information_screen/personal_information_screen_controller.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalInformationScreenController());
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          TopBarArea(title: S.current.personalInformation),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: GetBuilder(
                init: controller,
                builder: (context) {
                  return controller.isLoading
                      ? CustomUi.loaderWidget()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: ColorRes.whiteSmoke,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: controller.onImagePick,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: GetBuilder(
                                            init: controller,
                                            builder: (context) {
                                              return controller.profileImage !=
                                                      null
                                                  ? Image(
                                                      image: FileImage(
                                                          controller
                                                              .profileImage!),
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : controller.netWorkProfileImage !=
                                                          null
                                                      ? Image(
                                                          image: NetworkImage(
                                                            '${ConstRes.itemBaseURL}${controller.netWorkProfileImage}',
                                                          ),
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : CustomUi.userPlaceHolder(
                                                          male: controller
                                                                  .doctorData
                                                                  ?.gender ??
                                                              0,
                                                          height: 100);
                                            },
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 7, sigmaY: 7),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: ColorRes.charcoalGrey
                                                      .withOpacity(0.4),
                                                  shape: BoxShape.circle),
                                              child: Image.asset(
                                                  AssetRes.messageEditBox),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.nameController.text,
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
                                              width: 18,
                                              height: 18,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                controller
                                                    .designationController.text,
                                                style: const TextStyle(
                                                    color:
                                                        ColorRes.havelockBlue,
                                                    fontSize: 15,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          controller.degreeController.text,
                                          style: const TextStyle(
                                              fontSize: 14.5,
                                              color: ColorRes.mediumGrey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                S.current.phoneNumber,
                                style: const TextStyle(
                                  fontFamily: FontRes.semiBold,
                                  color: ColorRes.charcoalGrey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              color: ColorRes.aquaHaze,
                              child: Stack(
                                children: [
                                  Container(
                                    width: Get.width / 5,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      color: ColorRes.charcoalGrey,
                                    ),
                                  ),
                                  InternationalPhoneNumberInput(
                                    textFieldController:
                                        controller.phoneNumberEditController,
                                    onInputChanged: (PhoneNumber number) {
                                      controller.phoneNumber = number;
                                    },
                                    countrySelectorScrollControlled: true,
                                    selectorConfig: const SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.DIALOG,
                                      leadingPadding: 7,
                                      trailingSpace: true,
                                      showFlags: false,
                                      useEmoji: true,
                                    ),
                                    selectorTextStyle: const TextStyle(
                                            fontFamily: FontRes.semiBold,
                                            color: ColorRes.white,
                                            fontSize: 15)
                                        .copyWith(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    textStyle: const TextStyle(
                                      fontFamily: FontRes.bold,
                                      color: ColorRes.charcoalGrey,
                                    ),
                                    cursorColor: ColorRes.battleshipGrey,
                                    keyboardAction: TextInputAction.done,
                                    initialValue: controller.phoneNumber,
                                    formatInput: true,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: false),
                                    inputDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.only(left: 5),
                                      hintText: S.current.enterMobileNumber,
                                      hintStyle: TextStyle(
                                          fontFamily: FontRes.medium,
                                          color: ColorRes.battleshipGrey
                                              .withOpacity(0.5),
                                          fontSize: 14),
                                      isCollapsed: false,
                                      counterText: "",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   height: 50,
                            //   width: double.infinity,
                            //   color: ColorRes.aquaHaze,
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         height: 50,
                            //         width: 100,
                            //         color: ColorRes.mercury,
                            //         alignment: Alignment.center,
                            //         child: const Text(
                            //           '+91',
                            //           style: TextStyle(
                            //               color: ColorRes.charcoalGrey,
                            //               fontFamily: FontRes.semiBold,
                            //               fontSize: 16),
                            //         ),
                            //       ),
                            //       const Expanded(
                            //         child: TextField(
                            //           decoration: InputDecoration(
                            //             border: InputBorder.none,
                            //             contentPadding: EdgeInsets.symmetric(
                            //               horizontal: 10,
                            //             ),
                            //           ),
                            //           style: TextStyle(
                            //             fontFamily: FontRes.medium,
                            //             color: ColorRes.battleshipGrey,
                            //             fontSize: 15,
                            //           ),
                            //           cursorColor: ColorRes.charcoalGrey,
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            GetBuilder(
                                init: controller,
                                builder: (context) {
                                  return DoctorProfileTextField(
                                    isExample: false,
                                    title: S.current.yourName,
                                    exampleTitle: "",
                                    onChange: controller.onNameChange,
                                    textFieldColor: ColorRes.mediumGrey,
                                    textFieldFontFamily: FontRes.medium,
                                    hintTitle: S.current.enterYourName,
                                    controller: controller.nameController,
                                    focusNode: controller.nameFocusNode,
                                  );
                                }),
                            GetBuilder(
                                init: controller,
                                builder: (context) {
                                  return DoctorProfileTextField(
                                    isExample: false,
                                    title: S.current.designationEtc,
                                    exampleTitle: "",
                                    onChange: controller.onDesignationChange,
                                    textFieldColor: ColorRes.mediumGrey,
                                    textFieldFontFamily: FontRes.medium,
                                    hintTitle: S.current.enterDesignation,
                                    controller:
                                        controller.designationController,
                                    focusNode: controller.designationFocusNode,
                                  );
                                }),
                            GetBuilder(
                                init: controller,
                                builder: (context) {
                                  return DoctorProfileTextField(
                                    title: S.current.enterYourDegreesEtc,
                                    exampleTitle: S.current.exampleMsEtc,
                                    onChange: controller.onDegreeChange,
                                    hintTitle: S.current.enterDesignation,
                                    textFieldColor: ColorRes.mediumGrey,
                                    textFieldFontFamily: FontRes.medium,
                                    controller: controller.degreeController,
                                    focusNode: controller.degreeFocusNode,
                                    textFieldHeight: 100,
                                    isExpand: true,
                                  );
                                }),
                            GetBuilder(
                                init: controller,
                                builder: (context) {
                                  return DoctorProfileTextField(
                                    title: S.current.languagesYouSpeakEtc,
                                    exampleTitle: S.current.exampleLanguage,
                                    hintTitle: S.current.enterLanguages,
                                    textFieldColor: ColorRes.mediumGrey,
                                    textFieldFontFamily: FontRes.medium,
                                    controller: controller.languageController,
                                    focusNode: controller.languageFocusNode,
                                  );
                                }),
                            GetBuilder(
                                init: controller,
                                builder: (context) {
                                  return DoctorProfileTextField(
                                    title: S.current.yearsOfExperience,
                                    isExample: false,
                                    exampleTitle: "",
                                    textFieldColor: ColorRes.mediumGrey,
                                    textFieldFontFamily: FontRes.medium,
                                    hintTitle: S.current.numberOfYears,
                                    controller: controller.yearController,
                                    textInputType: TextInputType.number,
                                    focusNode: controller.yearFocusNode,
                                  );
                                }),
                            GetBuilder(
                              init: controller,
                              builder: (context) {
                                return DoctorProfileTextField(
                                  title: S.current.consultationFee,
                                  exampleTitle: S.current.youCanChangeThisEtc,
                                  hintTitle: '00',
                                  textFieldColor: ColorRes.mediumGrey,
                                  textFieldFontFamily: FontRes.medium,
                                  controller: controller.feesController,
                                  textInputType: TextInputType.number,
                                  focusNode: controller.feesFocusNode,
                                  isDollar: true,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                },
              ),
            ),
          ),
          DoctorRegButton(
            onTap: controller.updateProfileApiCall,
            title: S.current.continueText,
          ),
        ],
      ),
    );
  }
}
