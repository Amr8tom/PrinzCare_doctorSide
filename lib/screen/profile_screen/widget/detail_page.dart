import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/profile_screen/profile_screen_controller.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/languages.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/no_data_card.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/service_text.dart';
import 'package:doctor_flutter/screen/service_location_screen/widget/add_service_location.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final ProfileScreenController controller;

  const DetailPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AboutDr(controller: controller),
        Languages(controller: controller),
        Service(controller: controller),
        Expertise(controller: controller),
        ServiceLocation(controller: controller),
      ],
    );
  }
}

class AboutDr extends StatelessWidget {
  final ProfileScreenController controller;

  const AboutDr({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.snowDrift,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            S.current.aboutDr.toUpperCase(),
            style: const TextStyle(
                fontSize: 14,
                fontFamily: FontRes.semiBold,
                color: ColorRes.charcoalGrey,
                letterSpacing: 1),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder(
            init: controller,
            builder: (context) {
              return Text(
                controller.doctorData?.aboutYouself ?? S.current.noData,
                style:
                    const TextStyle(color: ColorRes.mediumGrey, fontSize: 15),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Service extends StatelessWidget {
  final ProfileScreenController controller;

  const Service({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return Container(
          color: ColorRes.snowDrift,
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceHeading(
                heading: S.current.services.toUpperCase(),
                onManageTap: () {
                  controller.navigateServiceScreen(type: 0);
                },
                isManageVisible: controller.doctorData?.services == null ||
                        controller.doctorData!.services!.isEmpty
                    ? false
                    : true,
              ),
              controller.doctorData?.services == null ||
                      controller.doctorData!.services!.isEmpty
                  ? NoDataCard(
                      title: S.current.services,
                      example: S.current.exampleHypertensionEtc,
                      onTap: () => controller.navigateServiceScreen(type: 0),
                    )
                  : ServiceText(
                      itemCount: !controller.isShowMore &&
                              (controller.doctorData?.services?.length ?? 0) > 4
                          ? 4
                          : controller.doctorData?.services?.length,
                      services: controller.doctorData?.services),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: (controller.doctorData?.services?.length ?? 0) > 4
                    ? true
                    : false,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      controller.onShowMoreTap();
                    },
                    child: Text(
                      controller.isShowMore
                          ? S.current.less
                          : "+${(controller.doctorData?.services?.length ?? 0) - 4} ${S.current.more}",
                      style: const TextStyle(
                          fontFamily: FontRes.semiBold,
                          fontSize: 15,
                          color: ColorRes.havelockBlue),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: (controller.doctorData?.services?.length ?? 0) > 4
                    ? true
                    : false,
                child: const SizedBox(
                  height: 10,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Expertise extends StatelessWidget {
  final ProfileScreenController controller;

  const Expertise({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return Container(
          color: ColorRes.snowDrift,
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceHeading(
                heading: S.current.expertise.toUpperCase(),
                onManageTap: () {
                  controller.navigateServiceScreen(type: 1);
                },
                isManageVisible: controller.doctorData?.expertise == null ||
                        controller.doctorData!.expertise!.isEmpty
                    ? false
                    : true,
              ),
              controller.doctorData?.expertise == null ||
                      controller.doctorData!.expertise!.isEmpty
                  ? NoDataCard(
                      title: S.current.expertise,
                      example: S.current.exampleAllergistsEtc,
                      onTap: () => controller.navigateServiceScreen(type: 1),
                    )
                  : ServiceText(
                      itemCount: !controller.isShowMore &&
                              (controller.doctorData?.expertise?.length ?? 0) >
                                  4
                          ? 4
                          : controller.doctorData?.expertise?.length,
                      services: controller.doctorData?.expertise,
                    ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: (controller.doctorData?.expertise?.length ?? 0) > 4
                    ? true
                    : false,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      controller.onShowMoreTap();
                    },
                    child: Text(
                      controller.isShowMore
                          ? S.current.less
                          : "+${(controller.doctorData?.expertise?.length ?? 0) - 4} ${S.current.more}",
                      style: const TextStyle(
                          fontFamily: FontRes.semiBold,
                          fontSize: 15,
                          color: ColorRes.havelockBlue),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: (controller.doctorData?.expertise?.length ?? 0) > 4
                    ? true
                    : false,
                child: const SizedBox(
                  height: 10,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ServiceLocation extends StatelessWidget {
  final ProfileScreenController controller;

  const ServiceLocation({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.snowDrift,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder(
              init: controller,
              builder: (context) {
                return ServiceHeading(
                  heading: S.current.servicesLocation.toUpperCase(),
                  onManageTap: controller.navigateServiceLocationScreen,
                  isManageVisible:
                      controller.doctorData?.serviceLocations == null ||
                              controller.doctorData!.serviceLocations!.isEmpty
                          ? false
                          : true,
                );
              }),
          _serviceLocationCard()
        ],
      ),
    );
  }

  Widget _serviceLocationCard() {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return controller.doctorData?.serviceLocations == null ||
                controller.doctorData!.serviceLocations!.isEmpty
            ? NoDataCard(
                title: S.current.serviceLocations,
                example: S.current.exampleServiceLocation,
                onTap: controller.navigateServiceLocationScreen,
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.doctorData?.serviceLocations?.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  ServiceLocations? serviceLocations =
                      controller.doctorData!.serviceLocations?[index];
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => AddServiceLocation(
                          apiType: 2,
                          serviceLocations: serviceLocations,
                        ),
                      )?.then(
                        (value) {
                          controller.doctorProfileApiCall();
                        },
                      );
                    },
                    child: Container(
                      color: index % 2 == 0
                          ? ColorRes.whiteSmoke
                          : ColorRes.snowDrift,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  serviceLocations?.hospitalTitle ?? '',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: FontRes.bold,
                                      color: ColorRes.davyGrey,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Icon(
                                Directionality.of(context) == TextDirection.rtl
                                    ? Icons.keyboard_arrow_left_rounded
                                    : Icons.keyboard_arrow_right_rounded,
                                color: ColorRes.tuftsBlue,
                                size: 30,
                              )
                            ],
                          ),
                          Text(
                            serviceLocations?.hospitalAddress ??
                                S.current.noAddressFound,
                            style: const TextStyle(
                              fontSize: 14,
                              color: ColorRes.davyGrey,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
