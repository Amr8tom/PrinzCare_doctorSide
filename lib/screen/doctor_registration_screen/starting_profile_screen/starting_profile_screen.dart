import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/starting_profile_screen/starting_profile_screen_controller.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/starting_profile_screen/widget/drop_down_menu.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class StartingProfileScreen extends StatelessWidget {
  const StartingProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StartingProfileScreenController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarArea(title: S.current.doctorRegistration),
          _yourName(controller),
          DoctorRegButton(
            onTap: controller.updateDoctorDetailsApiCall,
            title: S.current.continueText,
          ),
        ],
      ),
    );
  }

  Widget _yourName(StartingProfileScreenController controller) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Mobile number',
                style: TextStyle(
                    fontFamily: FontRes.regular,
                    fontSize: 15,
                    color: ColorRes.battleshipGrey),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorRes.silverChalice.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: Get.width / 4,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: ColorRes.charcoalGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        controller.phoneNumber = number;
                      },
                      countrySelectorScrollControlled: true,
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                        leadingPadding: 7,
                        trailingSpace: true,
                        showFlags: true,
                        useEmoji: true,
                      ),
                      selectorTextStyle: const TextStyle(
                              fontFamily: FontRes.semiBold,
                              color: ColorRes.white,
                              fontSize: 18)
                          .copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                      textStyle: const TextStyle(
                        fontFamily: FontRes.bold,
                        color: ColorRes.charcoalGrey,
                      ),
                      cursorColor: ColorRes.battleshipGrey,
                      keyboardAction: TextInputAction.done,
                      initialValue: PhoneNumber(isoCode: "IN"),
                      formatInput: true,
                      keyboardType:
                          const TextInputType.numberWithOptions(signed: false),
                      inputDecoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.only(left: 5),
                        hintText: S.current.enterMobileNumber,
                        hintStyle: TextStyle(
                            fontFamily: FontRes.medium,
                            color: ColorRes.battleshipGrey.withOpacity(0.5),
                            fontSize: 14),
                        isCollapsed: false,
                        counterText: "",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                S.current.selectCountry,
                style: const TextStyle(
                  fontFamily: FontRes.regular,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder(
                init: controller,
                builder: (context) {
                  return InkWell(
                    onTap: () => controller.countryBottomSheet(controller),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: ColorRes.whiteSmoke,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            controller.selectCountry?.countryName ?? '',
                            style: const TextStyle(
                                fontFamily: FontRes.bold,
                                fontSize: 15,
                                color: ColorRes.charcoalGrey),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: ColorRes.charcoalGrey,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                S.current.selectGender,
                style: const TextStyle(
                  fontFamily: FontRes.regular,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<StartingProfileScreenController>(
                id: kSelectGender,
                init: controller,
                builder: (controller) => DropDownMenu(
                    items: controller.genders,
                    initialValue: controller.selectGender,
                    onChange: controller.onGenderChange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
