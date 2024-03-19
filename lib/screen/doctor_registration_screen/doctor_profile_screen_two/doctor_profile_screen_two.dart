import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_two/doctor_profile_screen_two_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfileScreenTwo extends StatelessWidget {
  const DoctorProfileScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorProfileScreenTwoController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarArea(
              title: Get.arguments == null
                  ? S.current.doctorRegistration
                  : S.current.aboutAndEducation),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  GetBuilder(
                      init: controller,
                      builder: (context) {
                        return _textField(
                            title: S.current.aboutYourSelf,
                            exampleTitle: S.current.explainAboutYourSelfBriefly,
                            textController: controller.aboutController,
                            focusNode: controller.aboutFocusNode,
                            onChange: controller.onAboutChange,
                            controller: controller);
                      }),
                  GetBuilder(
                      init: controller,
                      builder: (context) {
                        return _textField(
                            title: S.current.yourEducationalJourney,
                            exampleTitle: S.current.explainBrieflyForBetterIdea,
                            textController: controller.educationController,
                            focusNode: controller.educationFocusNode,
                            onChange: controller.onEducationChange,
                            controller: controller);
                      }),
                ],
              ),
            ),
          ),
          DoctorRegButton(
            onTap: controller.updateDoctorDetailsApiCall,
            title: S.current.continueText,
          )
        ],
      ),
    );
  }

  Widget _textField(
      {required String title,
      required String exampleTitle,
      required TextEditingController textController,
      required Function(String value) onChange,
      required DoctorProfileScreenTwoController controller,
      required FocusNode focusNode}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
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
                exampleTitle,
                style: const TextStyle(
                  fontFamily: FontRes.regular,
                  color: ColorRes.battleshipGrey,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          color: ColorRes.whiteSmoke,
          child: TextField(
            controller: textController,
            focusNode: focusNode,
            expands: true,
            minLines: null,
            maxLines: null,
            maxLength: 400,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.all(10),
              hintText: S.current.enterHere,
              hintStyle: const TextStyle(
                fontFamily: FontRes.medium,
                color: ColorRes.silverChalice,
              ),
              counterText: "",
            ),
            onChanged: onChange,
            style: const TextStyle(
                fontFamily: FontRes.medium,
                color: ColorRes.battleshipGrey,
                fontSize: 15),
            cursorHeight: 15,
            cursorColor: ColorRes.charcoalGrey,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<DoctorProfileScreenTwoController>(
            init: controller,
            builder: (context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerRight,
                child: Text(
                  "${textController.text.length}/$fourHundred",
                  style:
                      const TextStyle(fontSize: 17, color: ColorRes.davyGrey),
                ),
              );
            }),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
