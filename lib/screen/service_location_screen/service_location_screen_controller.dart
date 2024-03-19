import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/map_screen/map_screen.dart';
import 'package:doctor_flutter/screen/service_location_screen/widget/add_service_location.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceLocationScreenController extends GetxController {
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController hospitalAddressController = TextEditingController();
  bool isLoading = false;
  List<ServiceLocations>? serviceLocation;
  double? latitude;
  double? longitude;

  @override
  void onInit() {
    doctorProfileApiCall();
    super.onInit();
  }

  void doctorProfileApiCall() async {
    isLoading = true;
    ApiService.instance.fetchMyDoctorProfile().then((value) {
      serviceLocation = value.data?.serviceLocations;
      isLoading = false;
      update();
    });
  }

  void addServiceLocationApiCall(
      {required int type, int? id, bool isBack = false}) async {
    if (hospitalNameController.text.isEmpty) {
      CustomUi.snackBar(
          message:
              '${S.current.please} ${type == 1 ? S.current.add : S.current.edit} ${S.current.hospitalName}',
          iconData: Icons.local_hospital);
      return;
    } else if (hospitalAddressController.text.isEmpty) {
      CustomUi.snackBar(
          message:
              '${S.current.please} ${type == 1 ? S.current.add : S.current.edit} ${S.current.hospitalAddress}',
          iconData: Icons.local_hospital);
      return;
    }
    CustomUi.loader();
    await ApiService.instance
        .addEditServiceLocations(
            type: type,
            hospitalTitle: hospitalNameController.text,
            hospitalAddress: hospitalAddressController.text,
            hospitalLat: latitude,
            hospitalLong: longitude,
            serviceLocationId: id)
        .then((value) {
      if (isBack) {
        Get.back();
      }
      Get.back();
      if (value.status == true) {
        serviceLocation = value.data?.serviceLocations;
        CustomUi.snackBar(
            iconData: Icons.location_city,
            message: value.message,
            positive: true);
        update();
      } else {
        CustomUi.snackBar(
            iconData: Icons.location_city, message: value.message);
      }
    });
  }

  void navigatePage(
      {required int apiType, ServiceLocations? serviceLocations}) {
    Get.to(() => AddServiceLocation(
          apiType: apiType,
          serviceLocations: serviceLocations,
        ))?.then((value) {
      latitude = null;
      longitude = null;
      hospitalNameController.clear();
      hospitalAddressController.clear();
    });
  }

  void navigateMapScreen(ServiceLocations? data, int apiType) {
    if (data?.hospitalLat == null || data?.hospitalLat == 'null') {
      Get.to<List<double?>>(
        () => const MapScreen(),
      )?.then((value) {
        latitude = value?[0];
        longitude = value?[1];
        update();
      });
    } else {
      Get.to<List<double?>>(
        () => MapScreen(
            latitude: data?.hospitalLat != null || data?.hospitalLat != 'null'
                ? double.parse(
                    data?.hospitalLat ?? '0',
                  )
                : 1.0,
            longitude:
                data?.hospitalLong != null || data?.hospitalLong != 'null'
                    ? double.parse(data?.hospitalLong ?? '0')
                    : 1.0),
      )?.then((value) {
        latitude = value?[0];
        longitude = value?[1];
        update();
      });
    }
  }
}
