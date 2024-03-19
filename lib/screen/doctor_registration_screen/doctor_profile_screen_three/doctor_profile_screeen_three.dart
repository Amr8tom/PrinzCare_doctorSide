import 'package:doctor_flutter/common/doctor_profile_text_filed.dart';
import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_three/doctor_profile_screen_three_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DoctorProfileScreenThree extends StatelessWidget {
  const DoctorProfileScreenThree({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorProfileScreenThreeController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarArea(
              title: Get.arguments == null
                  ? S.current.doctorRegistration
                  : S.current.consultationType),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: Get.height,
                  width: double.infinity,
                  color: ColorRes.white,
                ),
                SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _centerArea(controller),
                      GetBuilder(
                        init: controller,
                        builder: (context) {
                          return Visibility(
                            visible: controller.isAtClinic,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  color: ColorRes.whiteSmoke,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.current.addClinicDetails,
                                        style: const TextStyle(
                                          fontFamily: FontRes.semiBold,
                                          color: ColorRes.charcoalGrey,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        S.current
                                            .whereYouWillBeConsultingPatients,
                                        style: const TextStyle(
                                          fontFamily: FontRes.regular,
                                          color: ColorRes.battleshipGrey,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GetBuilder(
                                    init: controller,
                                    builder: (context) {
                                      return DoctorProfileTextField(
                                        title: S.current.clinicName,
                                        isExample: false,
                                        exampleTitle: "",
                                        hintTitle: S.current.enterHere,
                                        controller:
                                            controller.clinicNameController,
                                        focusNode:
                                            controller.clinicNameFocusNode,
                                      );
                                    }),
                                GetBuilder(
                                  init: controller,
                                  builder: (context) {
                                    return DoctorProfileTextField(
                                      title: S.current.clinicAddress,
                                      isExample: false,
                                      isExpand: true,
                                      exampleTitle: "",
                                      hintTitle: S.current.enterHere,
                                      textFieldHeight: 100,
                                      controller:
                                          controller.clinicAddressController,
                                      focusNode:
                                          controller.clinicAddressFocusNode,
                                      textInputType: TextInputType.multiline,
                                    );
                                  },
                                ),
                                _fetchLocation(controller)
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          DoctorRegButton(
            onTap: () {
              controller.updateDoctorDetailsApiCall();
            },
            title: S.current.continueText,
          )
        ],
      ),
    );
  }

  Widget _centerArea(DoctorProfileScreenThreeController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: ColorRes.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            S.current.chooseConsultationType,
            style: const TextStyle(
                fontFamily: FontRes.semiBold,
                fontSize: 16,
                color: ColorRes.charcoalGrey),
          ),
          Text(
            S.current.youCanChangeThisLater,
            style: const TextStyle(color: ColorRes.battleshipGrey),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              GetBuilder<DoctorProfileScreenThreeController>(
                  init: controller,
                  builder: (controller) => _checkBox(
                      context: Get.context!,
                      onChange: controller.onChangeOnline,
                      value: controller.isOnline)),
              Text(
                S.current.atHome,
                style: const TextStyle(
                    color: ColorRes.grey, fontFamily: FontRes.semiBold),
              ),
              GetBuilder<DoctorProfileScreenThreeController>(
                  init: controller,
                  builder: (controller) => _checkBox(
                      context: Get.context!,
                      onChange: controller.onChangeAtClinic,
                      value: controller.isAtClinic)),
              Text(
                S.current.atClinic,
                style: const TextStyle(
                    color: ColorRes.grey, fontFamily: FontRes.semiBold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _checkBox(
      {required BuildContext context,
      bool? value,
      required Function(bool? value) onChange}) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: ColorRes.darkSkyBlue,
      ),
      child: Checkbox(
        splashRadius: 10,
        value: value,
        onChanged: onChange,
        activeColor: ColorRes.tuftsBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Widget _fetchLocation(DoctorProfileScreenThreeController controller) {
    return Column(
      children: [
        Container(
          color: ColorRes.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                S.current.clinicLocation,
                style: const TextStyle(
                  fontFamily: FontRes.semiBold,
                  color: ColorRes.charcoalGrey,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        GetBuilder(
          init: controller,
          builder: (controller) {
            return InkWell(
              onTap: () {
                controller.onLocationFetchTap();
              },
              child: Container(
                height: 45,
                width: double.infinity,
                color: controller.latitude != null
                    ? ColorRes.irishGreen.withOpacity(0.10)
                    : ColorRes.whiteSmoke,
                alignment: Alignment.centerLeft,
                child: Text(
                  "  ${controller.latitude != null ? S.current.locationFetched : S.current.clickToFetchLocation}",
                  style: TextStyle(
                      color: controller.latitude != null
                          ? ColorRes.irishGreen
                          : ColorRes.silverChalice,
                      fontFamily: FontRes.medium,
                      fontSize: 15),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
