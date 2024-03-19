import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/settings_filed_top_bar.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/service_location_screen/service_location_screen_controller.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceLocationScreen extends StatelessWidget {
  const ServiceLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceLocationScreenController());
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          TopBarArea(title: S.current.serviceLocations),
          SettingsFiledTopBar(
              title1: S.current.addHospitalsWhereYouEtc,
              title2: S.current.thisHelpsPatientsToEtc),
          GetBuilder(
            init: controller,
            builder: (context) {
              return controller.isLoading
                  ? CustomUi.loaderWidget()
                  : _serviceLocationList(controller: controller);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.navigatePage(
          apiType: 1,
        ),
        backgroundColor: ColorRes.tuftsBlue,
        child: const Icon(
          Icons.add_rounded,
          color: ColorRes.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _serviceLocationList(
      {required ServiceLocationScreenController controller}) {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return Expanded(
          child: controller.serviceLocation == null ||
                  controller.serviceLocation!.isEmpty
              ? CustomUi.noData(
                  message: '${S.current.no} ${S.current.servicesLocation}')
              : ListView.builder(
                  itemCount: controller.serviceLocation?.length ?? 0,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    ServiceLocations? data = controller.serviceLocation?[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      color: index % 2 == 0
                          ? ColorRes.whiteSmoke
                          : ColorRes.snowDrift,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data?.hospitalTitle ?? '',
                                  style: const TextStyle(
                                    fontFamily: FontRes.bold,
                                    fontSize: 15,
                                    color: ColorRes.davyGrey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data?.hospitalAddress ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: ColorRes.davyGrey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          PopUpMenuCustom(controller: controller, data: data),
                        ],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

class PopUpMenuCustom extends StatefulWidget {
  final ServiceLocationScreenController controller;
  final ServiceLocations? data;

  const PopUpMenuCustom({
    Key? key,
    required this.controller,
    this.data,
  }) : super(key: key);

  @override
  State<PopUpMenuCustom> createState() => _PopUpMenuCustomState();
}

class _PopUpMenuCustomState extends State<PopUpMenuCustom> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: ColorRes.whiteSmoke,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
      ),
      child: Image.asset(
        AssetRes.icMore,
        width: 18,
        height: 18,
        color: ColorRes.tuftsBlue,
      ),
      onSelected: (value) {
        widget.controller.hospitalNameController =
            TextEditingController(text: widget.data?.hospitalTitle ?? '');
        widget.controller.hospitalAddressController =
            TextEditingController(text: widget.data?.hospitalAddress ?? '');

        if (value == 0) {
          widget.controller
              .navigatePage(apiType: 2, serviceLocations: widget.data);
        } else {
          widget.controller.addServiceLocationApiCall(
            type: 3,
            id: widget.data?.id,
          );
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Text(S.current.edit),
        ),
        PopupMenuItem(
          value: 1,
          child: Text(S.current.delete),
        ),
      ],
    );
  }
}
