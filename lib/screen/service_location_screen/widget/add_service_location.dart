import 'package:doctor_flutter/common/doctor_profile_text_filed.dart';
import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/service_location_screen/service_location_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddServiceLocation extends StatelessWidget {
  final int apiType;
  final ServiceLocations? serviceLocations;

  const AddServiceLocation({
    Key? key,
    required this.apiType,
    required this.serviceLocations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceLocationScreenController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarArea(
            title: apiType == 1
                ? S.current.addServiceLocation
                : S.current.editServiceLocation,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder(
                      init: controller,
                      initState: (state) {
                        controller.hospitalNameController =
                            TextEditingController(
                                text: serviceLocations?.hospitalTitle ?? '');
                      },
                      builder: (context) {
                        return DoctorProfileTextField(
                            isExample: false,
                            title: S.current.hospitalName,
                            exampleTitle: "",
                            hintTitle: S.current.enterHere,
                            controller: controller.hospitalNameController);
                      }),
                  GetBuilder(
                      init: controller,
                      initState: (state) {
                        controller.hospitalAddressController =
                            TextEditingController(
                                text: serviceLocations?.hospitalAddress ?? '');
                      },
                      builder: (context) {
                        return DoctorProfileTextField(
                            isExample: false,
                            isExpand: true,
                            textFieldHeight: 100,
                            title: S.current.hospitalAddress,
                            exampleTitle: "",
                            hintTitle: S.current.enterHere,
                            textInputType: TextInputType.multiline,
                            controller: controller.hospitalAddressController);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          S.current.location,
                          style: const TextStyle(
                              fontFamily: FontRes.semiBold,
                              color: ColorRes.charcoalGrey,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder(
                        init: controller,
                        builder: (context) {
                          return InkWell(
                            onTap: () => controller.navigateMapScreen(
                                serviceLocations, apiType),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              color: (serviceLocations?.hospitalLong == null ||
                                          serviceLocations?.hospitalLong ==
                                              'null') &&
                                      controller.longitude == null
                                  ? ColorRes.whiteSmoke
                                  : ColorRes.mediumGreen.withOpacity(0.1),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                (serviceLocations?.hospitalLong == null ||
                                            serviceLocations?.hospitalLong ==
                                                'null') &&
                                        controller.longitude == null
                                    ? S.current.clickToFetchLocation
                                    : S.current.locationFetched,
                                style: TextStyle(
                                  fontFamily: FontRes.medium,
                                  fontSize: 15,
                                  color: (serviceLocations?.hospitalLong ==
                                                  null ||
                                              serviceLocations?.hospitalLong ==
                                                  'null') &&
                                          controller.longitude == null
                                      ? ColorRes.silverChalice
                                      : ColorRes.irishGreen,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          DoctorRegButton(
            onTap: () => controller.addServiceLocationApiCall(
                type: apiType, id: serviceLocations?.id, isBack: true),
            title: apiType == 1 ? S.current.add : S.current.edit,
          )
        ],
      ),
    );
  }
}
