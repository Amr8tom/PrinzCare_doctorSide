import 'package:doctor_flutter/model/wallet/payout_history.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:get/get.dart';

class PayoutsHistoryScreenController extends GetxController {
  List<PayoutHistoryData>? payoutData;
  bool isLoading = false;

  @override
  void onInit() {
    fetchDoctorPayoutHistoryApiCall();
    super.onInit();
  }

  void fetchDoctorPayoutHistoryApiCall() {
    isLoading = true;
    ApiService.instance.fetchDoctorPayoutHistory().then((value) {
      payoutData = value.data;
      isLoading = false;
      update();
    });
  }
}
