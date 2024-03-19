import 'package:doctor_flutter/service/api_service.dart';
import 'package:get/get.dart';

class ProfileDetailScreenController extends GetxController {
  @override
  void onInit() {
    fetchDoctorProfile();
    super.onInit();
  }

  void fetchDoctorProfile() {
    ApiService.instance.fetchMyDoctorProfile();
  }
}
